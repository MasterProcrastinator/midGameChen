//
//  GameViewController.swift
//  midGameChen
//
//  Created by ALVIN CHEN on 3/5/24.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    var play : GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
            self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
            self.view.addGestureRecognizer(swipeLeft)

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
    swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        
        
        
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
                    UIDevice.current.setValue(value, forKey: "orientation")
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                play = (scene as! GameScene)
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .all
        }
    }

    
    @IBAction func restartAction(_ sender: UIButton) {
        play.restart()
    }
    @IBAction func muteButt(_ sender: UIButton) {
        AppData.mutebutt = 1
        AppData.muteclicked = 0
        play.muteSound()
                print(AppData.mutebutt)
    }
    @IBAction func soundButt(_ sender: UIButton) {
        AppData.mutebutt = 0
        AppData.muteclicked = 1
        play.playSound()
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                if play.player
                    .position.x < 230{
                    play.jumpRight()
                }
            case UISwipeGestureRecognizer.Direction.down:
                if play.player.position.y > -200{
                    play.jumpDown()
                }
            case UISwipeGestureRecognizer.Direction.left:
                if play.player
                    .position.x > -230{
                    play.jumpLeft()
                }
            case UISwipeGestureRecognizer.Direction.up:
                play.jumpUp()
            default:
                break
            }
        }
    }
    
}
