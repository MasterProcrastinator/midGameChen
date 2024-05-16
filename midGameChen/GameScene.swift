//
//  GameScene.swift
//  midGameChen
//
//  Created by ALVIN CHEN on 3/5/24.
//

import SpriteKit
import GameplayKit
import AVFoundation
struct AppData{
    static var mutebutt = 0
    static var muteclicked = 0
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    var player: SKSpriteNode!
    var car: SKSpriteNode!
    var car2: SKSpriteNode!
    var car3: SKSpriteNode!
    var car4: SKSpriteNode!
    var car5: SKSpriteNode!
    var car6: SKSpriteNode!
    var car7: SKSpriteNode!
    var car8: SKSpriteNode!
    var pbear: SKSpriteNode!
    var penguin: SKSpriteNode!
    var mammoth: SKSpriteNode!
    var whiteFox: SKSpriteNode!
    var snowmobile: SKSpriteNode!
    var iceTrain: SKSpriteNode!
    var armadillo: SKSpriteNode!
    var spider: SKSpriteNode!
    var camel: SKSpriteNode!
    var scorpion: SKSpriteNode!
    var tortoise: SKSpriteNode!
    var desertScourge: SKSpriteNode!
    var sandShark: SKSpriteNode!
    var spider2: SKSpriteNode!
    var meteor: SKSpriteNode!
    var meteor2: SKSpriteNode!
    var meteor3: SKSpriteNode!
    var meteor4: SKSpriteNode!
    var moreIce: SKSpriteNode!
    var moreCrystal: SKSpriteNode!
    var iceberg: SKSpriteNode!
    var leviathan: SKSpriteNode!
    var shark: SKSpriteNode!
    var titanic: SKSpriteNode!
    var worseShark: SKSpriteNode!
    var sub: SKSpriteNode!
    var ship: SKSpriteNode!
    var penguinSwim: SKSpriteNode!
    var orca: SKSpriteNode!
    var farDeadd = false
    var future1: SKSpriteNode!
    var future2: SKSpriteNode!
    var future3: SKSpriteNode!
    
    let backgroundmusic = SKAudioNode(fileNamed: "bensound-goodmood")

    var restricted = false
    
    var wins = 0
    var lastCheckpoint = 0
    var checkpoint1 = 0
    var checkpoint2 = 2700
    var checkpoint3 = 8800
    var checkpoint4 = 12800
    var checkpoint5 = 16100
    var checkpoint6 = 17400
    var checkpoint7 = 18700
    var checkpoint8 = 33000
    var checkpoint9 = 36300
    
    var trueCheckpoint = 0
    
    
    
    
    
    
    
    
    var test = Vehicle(image: "car", width: 0, height: 0, dx: 0, dy: 0, x: 0)
    var deathsounds = [SKAudioNode(fileNamed: "death1"),SKAudioNode(fileNamed: "death2"),SKAudioNode(fileNamed: "death3"),SKAudioNode(fileNamed: "death4"),SKAudioNode(fileNamed: "death5"),SKAudioNode(fileNamed: "death6"),SKAudioNode(fileNamed: "death7"),SKAudioNode(fileNamed: "death8")
    ]
    var deathsoundnums = ["death1","death2","death3","death4","death5","death6","death7","death8"]
    
    
    
    var list = [Vehicle(image: "car", width: 80, height: 60, dx: -350, dy: 0, x: 480),
                Vehicle(image: "car2", width: 60, height: 60, dx: 350, dy: 0, x: -480),
                Vehicle(image: "car3", width: 141, height: 90, dx: 400, dy: 0, x: -480),
                Vehicle(image: "car4", width: 175, height: 100, dx: 450, dy: 0, x: -480),
                Vehicle(image: "car5", width: 114, height: 60, dx: -500, dy: 0, x: 480),
                Vehicle(image: "car7", width: 305, height: 185, dx: -800, dy: 0, x: 900),
                Vehicle(image: "car8", width: 1000, height: 127, dx: 100, dy: 0, x: -1000),
                Vehicle(image: "penguin", width: 60, height: 60, dx: 50, dy: 0, x: -480),
                Vehicle(image: "pbear", width: 220, height: 200, dx: 160, dy: 0, x: -480),
                Vehicle(image: "whiteFox", width: 160, height: 50, dx: -300, dy: 0, x: 480),
                Vehicle(image: "snowmobile", width: 175, height: 100, dx: 400, dy: 0, x: -480),
                Vehicle(image: "iceTrain", width: 2000, height: 150, dx: -50, dy: 0, x: 750),
                Vehicle(image: "mammoth", width: 730, height: 475, dx: 90, dy: 0, x: -700),
                Vehicle(image: "armadillo", width: 80, height: 75, dx: 200, dy: 0, x: -400),
                Vehicle(image: "camel", width: 110, height: 90, dx: -200, dy: 0, x: 400),
                Vehicle(image: "scorpion", width: 80, height: 65, dx: -170, dy: 0, x: 400),
                Vehicle(image: "tortoise", width: 90, height: 75, dx: 170, dy: 0, x: -400),
                Vehicle(image: "spider", width: 80, height: 70, dx: 150, dy: 0, x: -400),
                Vehicle(image: "desertScourge", width: 400, height: 80, dx: -300, dy: 0, x: 400),
                Vehicle(image: "sandShark", width: 200, height: 80, dx: -250, dy: 0, x: 400),
                Vehicle(image: "spider2", width: 80, height: 70, dx: -200, dy: 0, x: 400),
                Vehicle(image: "moreIce", width: 512, height: 512, dx: 0, dy: 0, x: 1000),
                Vehicle(image: "moreCrystal", width: 480, height: 200, dx: 0, dy: 0, x: 1000),
                Vehicle(image: "iceberg", width: 150, height: 150, dx: 0, dy: 0, x: 1000),
                Vehicle(image: "leviathan", width: 1500, height: 1000, dx: -100, dy: 0, x: 900),
                Vehicle(image: "shark", width: 700, height: 400, dx: -300, dy: 0, x: 500),
                Vehicle(image: "titanic", width: 1300, height: 400, dx: 200, dy: 0, x: -600),
                Vehicle(image: "worseShark", width: 400, height: 240, dx: -500, dy: 0, x: 480),
                Vehicle(image: "sub", width: 400, height: 270, dx: 240, dy: 0, x: -480),
                Vehicle(image: "ship", width: 400, height: 285, dx: -260, dy: 0, x: 500),
                Vehicle(image: "penguinSwim", width: 170, height: 190, dx: -400, dy: 0, x: 480),
                Vehicle(image: "orca", width: 300, height: 130, dx: 350, dy: 0, x: -480)
                
 
                

                
    ]
    
    
    
    
    
    
    
    
    let cam = SKCameraNode()
    var gameOver = false
    var winLoseOutlet: SKLabelNode!
    
    
    var timeLabel: SKLabelNode!
    var farthestLabel: SKLabelNode!
    var winsLabel: SKLabelNode!
    
    var gameTimer = 0
    var timer = Timer()
    var debugTeleport = 0.0
    var distance = 0
    var farthestDistance = 0
    var lives = 15
    var invisFollower: SKSpriteNode!
    var livesLabel: SKLabelNode!
    let defaults = UserDefaults.standard
    
    override func didMove(to view: SKView) {
        
        wins = defaults.integer(forKey: "win")
        
        farthestDistance = defaults.integer(forKey: "dist")
        
        
        //        let backgroundmusic = SKAudioNode(fileNamed: "bensound-goodmood")
        //        addChild(backgroundmusic)
        startTimer()
        timeLabel = (self.childNode(withName: "timeLabel") as! SKLabelNode)
        farthestLabel = (self.childNode(withName: "farthestLabel") as! SKLabelNode)
        livesLabel = (self.childNode(withName: "livesLabel") as! SKLabelNode)
        lives = 15
        winsLabel = (self.childNode(withName: "winsLabel") as! SKLabelNode)
        timeLabel.fontSize = 30
        
        winLoseOutlet = (self.childNode(withName: "statusLabel") as! SKLabelNode)
        winLoseOutlet.fontSize = 100
        winLoseOutlet.text = ""
        player = (self.childNode(withName: "player") as! SKSpriteNode)
        future1 = (self.childNode(withName: "future1") as! SKSpriteNode)
        future2 = (self.childNode(withName: "future2") as! SKSpriteNode)
        future3 = (self.childNode(withName: "future3") as! SKSpriteNode)
        invisFollower = (self.childNode(withName: "follower") as! SKSpriteNode)
        self.camera = cam
        self.physicsWorld.contactDelegate = self
        invisFollower.position.x = player.position.x
        invisFollower.position.y = player.position.y
        winLoseOutlet.position.x = player.position.x
        
        
       
muteSound()
//        let backgroundmusic = SKAudioNode(fileNamed: "bensound-goodmood")
//        addChild(backgroundmusic)
//        
        let count = list.count
        
        
        
        //33
        var testList = [car, car2, car3 ,car4, car5, car7, car8, penguin, pbear, mammoth, whiteFox, snowmobile, iceTrain, tortoise, spider, desertScourge, sandShark, spider2, scorpion, armadillo, sandShark, moreIce, moreCrystal, iceberg, leviathan, shark, titanic, worseShark, sub, ship, penguinSwim, orca]
        
        
        
        for i in 0...count-1{
            
            enumerateChildNodes(withName: list[i].image) { [self]
                (node, _) in
                car = node as? SKSpriteNode
                
                testList[i] = node as? SKSpriteNode
                
                testList[i]!.texture = SKTexture(imageNamed: list[i].image)
                testList[i]!.size.width = CGFloat(list[i].width)
                testList[i]!.size.height = CGFloat(list[i].height)
                testList[i]!.physicsBody?.mass = 100000
            }
            
            
            
        }
        
        enumerateChildNodes(withName: "penguin") { [self]
            (node, _) in
            penguin = node as? SKSpriteNode
            
            
            penguin.physicsBody?.mass = 0.0001
        }
        
        enumerateChildNodes(withName: "car6") { [self]
            (node, _) in
            
            car6 = node as? SKSpriteNode
            car6.texture = SKTexture(imageNamed: "car6")
            car6.physicsBody?.mass = 10000
            car6.size.width = 1500
            car6.size.height = 1500
            
            
            
        }
        //meteors go downward
        
        enumerateChildNodes(withName: "meteor") { [self]
            (node, _) in
            meteor = node as? SKSpriteNode

            meteor.texture = SKTexture(imageNamed: "meteor")
            meteor.size.width = 120
            meteor.size.height = 230
            meteor.physicsBody?.mass = 10000
        }
        
        enumerateChildNodes(withName: "meteor2") { [self]
            (node, _) in
            meteor2 = node as? SKSpriteNode

            meteor2.texture = SKTexture(imageNamed: "meteor2")
            meteor2.size.width = 80
            meteor2.size.height = 80
            meteor2.physicsBody?.mass = 10000
        }
        
        enumerateChildNodes(withName: "meteor3") { [self]
            (node, _) in
            meteor3 = node as? SKSpriteNode

            meteor3.texture = SKTexture(imageNamed: "meteor3")
            meteor3.size.width = 120
            meteor3.size.height = 120
            meteor3.physicsBody?.mass = 10000
        }
        
        enumerateChildNodes(withName: "meteor4") { [self]
            (node, _) in
            meteor4 = node as? SKSpriteNode

            meteor4.texture = SKTexture(imageNamed: "meteor4")
            meteor4.size.width = 100
            meteor4.size.height = 180
            meteor4.physicsBody?.mass = 10000
        }
        
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        
        
        
        if player.position.y >= 40500{
            restricted = true
            
            if (player.position.y < 42400 && player.position.x < 400 && player.position.x > -400){
                player.physicsBody?.velocity.dy = 300
            }
            else if (player.position.y > 42500 && player.position.x < 400 && player.position.x > -400){
                player.physicsBody?.velocity.dy = 0

            }
            

        }
        else{
            restricted = false
            future1.position.x = player.position.x
            future1.position.y = player.position.y + 100
            future2.position.x = player.position.x
            future2.position.y = player.position.y + 200
            future3.position.x = player.position.x
            future3.position.y = player.position.y + 300
        }
        
        if (player.position.y > 42500 && player.position.x < 400 && player.position.x > -400){
            cam.position.x = invisFollower.position.x - 300
        }
        
        else{
            cam.position.x = invisFollower.position.x
        }
        //checkpoint code
        if player.position.y < CGFloat(checkpoint2){
            lastCheckpoint = checkpoint1
            trueCheck()
        }
        else if (player.position.y >= CGFloat(checkpoint2) && player.position.y < CGFloat(checkpoint3)){
            lastCheckpoint = checkpoint2
            trueCheck()
        }
        else if (player.position.y >= CGFloat(checkpoint3) && player.position.y < CGFloat(checkpoint4)){
            lastCheckpoint = checkpoint3
            trueCheck()
        }
        else if (player.position.y >= CGFloat(checkpoint4) && player.position.y < CGFloat(checkpoint5)){
            lastCheckpoint = checkpoint4
            trueCheck()
        }
        else if (player.position.y >= CGFloat(checkpoint5) && player.position.y < CGFloat(checkpoint6)){
            lastCheckpoint = checkpoint5
            trueCheck()
        }
        else if (player.position.y >= CGFloat(checkpoint6) && player.position.y < CGFloat(checkpoint7)){
            lastCheckpoint = checkpoint6
            trueCheck()
        }
        else if (player.position.y >= CGFloat(checkpoint7) && player.position.y < CGFloat(checkpoint8)){
            lastCheckpoint = checkpoint7
            trueCheck()
        }
        
        else if (player.position.y >= CGFloat(checkpoint8) && player.position.y < CGFloat(checkpoint9)){
            lastCheckpoint = checkpoint8
            trueCheck()
        }
        else if (player.position.y >= CGFloat(checkpoint9) && player.position.y < 44000){
            lastCheckpoint = checkpoint9
            trueCheck()
        }
        
        //continue once done with space
        
        
        
        
        
        
        distance = Int(player.position.y)
       
        if(farDeadd == false){
            if distance > farthestDistance{
                farthestDistance = distance
                defaults.set(farthestDistance, forKey: "dist")
                
            }
        }
        
        timeLabel.text = "distance: \(distance)"
        farthestLabel.text = "farthest: \(farthestDistance)"
        winsLabel.text = "Wins: \(wins)"
        farthestLabel.position.y = invisFollower.position.y + 800
        farthestLabel.position.x = invisFollower.position.x + 220
        timeLabel.position.y = invisFollower.position.y + 850
        timeLabel.position.x = invisFollower.position.x + 190
        winsLabel.position.y = invisFollower.position.y + 750
        winsLabel.position.x = invisFollower.position.x + 220
        farthestLabel.fontName = "AvenirNext-Bold"
        timeLabel.fontName = "AvenirNext-Bold"
        winsLabel.fontName = "AvenirNext-Bold"

        livesLabel.text = "Lives: \(lives)"
        livesLabel.position.y = invisFollower.position.y + 750
        livesLabel.position.x = invisFollower.position.x
        
        livesLabel.fontName = "AvenirNext-Bold"
        cam.position.y = invisFollower.position.y + 300
        winLoseOutlet.position.y = cam.position.y
        
        if (player.position.y >= 31000 && player.position.y <= 31900){
            player.physicsBody?.velocity.dx = 0
            player.physicsBody?.velocity.dy = 0
            player.physicsBody?.friction = 0
            player.position.x = 0
            player.position.y = 33000
            invisFollower.position.y = player.position.y
            player.removeAllActions()
            invisFollower.removeAllActions()
        }
        if(player.position.y > 20000 && player.position.y < 32000){
            
            if (player.position.y >= invisFollower.position.y + 200){
                let moveFollower = SKAction.moveTo(y: player.position.y, duration: 0.5)
                invisFollower.run(moveFollower)
                
            }
            
            if (player.position.y <= invisFollower.position.y - 50){
                let moveFollower = SKAction.moveTo(y: player.position.y, duration: 0.3)
                invisFollower.run(moveFollower)
            }
            
        }
        else{
            if (player.position.y >= invisFollower.position.y + 500){
                let moveFollower = SKAction.moveTo(y: player.position.y, duration: 1)
                invisFollower.run(moveFollower)
                
            }
            
            if (player.position.y <= invisFollower.position.y - 50){
                let moveFollower = SKAction.moveTo(y: player.position.y, duration: 0.3)
                invisFollower.run(moveFollower)
            }
        }
        
        
        let count = list.count
        
        
        
        
        var testList = [car, car2, car3 ,car4, car5, car7, car8, penguin, pbear, mammoth, whiteFox, snowmobile, iceTrain, tortoise, spider, desertScourge, sandShark, spider2, scorpion, armadillo, sandShark, moreIce, moreCrystal, iceberg, leviathan, shark, titanic, worseShark, sub, ship, penguinSwim, orca]
        
        for i in 0...count-1{
            
            
            
            enumerateChildNodes(withName: list[i].image) { [self]
                (node, _) in
                testList[i] = node as? SKSpriteNode
                testList[i]!.physicsBody?.velocity.dx = CGFloat(list[i].dx)
                testList[i]!.physicsBody?.velocity.dy = CGFloat(list[i].dy)

                
                
                
                
                
                if (list[i].x <= 1) {
                    //right
                    if (Double(((testList[i]?.position.x)!)) > -1 * list[i].x){
                        testList[i]?.position.x = CGFloat((list[i].x))
                        //cars going right dont work
                        //left negative // right positive
                        
                        
                        
                    }
                }
                else if (list[i].x > 1){
                    //left
                    if (Double((testList[i]?.position.x)!) < -1 * list[i].x){
                        testList[i]?.position.x = CGFloat(list[i].x)
                    }
                }
                
                
                
                
                
                
            } //end func
            
            
            
        }
        
        
        
        
        enumerateChildNodes(withName: "meteor") { [self]
                         (node, _) in
            meteor = node as? SKSpriteNode
            meteor.physicsBody?.velocity.dx = 0
            meteor.physicsBody?.velocity.dy = -250
            
            if (meteor.position.x < -370 || meteor.position.x > 370 || meteor.position.y < 22000){
                let randomInt = Int.random(in: -300...300)
                meteor.position.y = 32000
                meteor.position.x = CGFloat(randomInt)
                

            }

        }
        
        enumerateChildNodes(withName: "car6") { [self]
                         (node, _) in
            car6 = node as? SKSpriteNode
            if(player.position.y > 42500){
                car6.physicsBody?.velocity.dx = 1300
            }
            else{
                car6.physicsBody?.velocity.dx = 0
            }
            


        }
        
        enumerateChildNodes(withName: "meteor2") { [self]
                         (node, _) in
            meteor2 = node as? SKSpriteNode
            meteor2.physicsBody?.velocity.dx = 0
            meteor2.physicsBody?.velocity.dy = -250
            
            if (meteor2.position.x < -370 || meteor2.position.x > 370 || meteor2.position.y < 22000){
                let randomInt = Int.random(in: -300...300)
                meteor2.position.y = 32000
                meteor2.position.x = CGFloat(randomInt)
                

            }

        }
        
        enumerateChildNodes(withName: "meteor3") { [self]
                         (node, _) in
            meteor3 = node as? SKSpriteNode
            meteor3.physicsBody?.velocity.dx = 0
            meteor3.physicsBody?.velocity.dy = -250
            
            if (meteor3.position.x < -370 || meteor3.position.x > 370 || meteor3.position.y < 22000){
                let randomInt = Int.random(in: -300...300)
                meteor3.position.y = 32000
                meteor3.position.x = CGFloat(randomInt)
                

            }

        }
        
        enumerateChildNodes(withName: "meteor4") { [self]
                         (node, _) in
            meteor4 = node as? SKSpriteNode
            meteor4.physicsBody?.velocity.dx = 0
            meteor4.physicsBody?.velocity.dy = -250
            
            if (meteor4.position.x < -370 || meteor4.position.x > 370 || meteor4.position.y < 22000){
                let randomInt = Int.random(in: -300...300)
                meteor4.position.y = 32000
                meteor4.position.x = CGFloat(randomInt)
                

            }

        }
        
        
        
        
        
        
        
        
        
        
    }  //end update
    
    func crash(){
        deathaffect()
        winLoseOutlet.text = "You Died"
        player.physicsBody?.friction = 0.5
        player.removeAllActions()
        gameOver = true
        GameOver()
        farDeadd = true
        stopTimer()
    }


    
    func didBegin(_ contact: SKPhysicsContact) {
        
        
        if(contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "car6") || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == "car6"){
            
            lives = 0
            winLoseOutlet.text = "You Won?"
            wins = wins + 1
            defaults.set(wins, forKey: "win")
            player.physicsBody?.velocity.dx = 0
            player.physicsBody?.velocity.dy = 0
            player.position.x = -10000
            player.position.y = 42500
            player.physicsBody?.friction = 0
            invisFollower.position.y = player.position.y
            invisFollower.position.x = player.position.x
            gameOver = true
            GameOver()
        }
        
        if(contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "meteor") || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == "meteor"){
            
            if(lives > 1){
                lives-=1
                teleportLastCheckpoint()
            }
            else{
                crash()
            }
            
        }
        
        if(contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "meteor2") || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == "meteor2"){
            
            if(lives > 1){
                lives-=1
                teleportLastCheckpoint()
            }
            else{
                crash()
            }
            
        }
        
        if(contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "meteor3") || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == "meteor3"){
            
            if(lives > 1){
                lives-=1
                teleportLastCheckpoint()
            }
            else{
                crash()
            }
            
        }
        
        if(contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "meteor4") || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == "meteor4"){
            
            if(lives > 1){
                lives-=1
                teleportLastCheckpoint()
            }
            else{
                crash()
            }
            
        }
        
        
        let count = list.count
        for i in 0...count-1{
            
            
        
            
            
            
            if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == list[i].image) || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == list[i].image){
                
                if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "penguin") || (contact.bodyB.node?.name == "player" && contact.bodyA.node?.name == "penguin"){
                    break
                }
                    
                    else if(lives > 1){
                        lives-=1
                        teleportLastCheckpoint()
                    }
                    else{
                        crash()
                    }
                
                
                //special feature later for car6
                
            }
            
            
            
            
        }
        
        
        
        
        
        
        
    }
    
    
    
    
    func startTimer()  {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func stopTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer(){
        gameTimer += 1
    }
    
    //add keys for the movements below
    
    func jumpUp(){
        if restricted == false{
            if gameOver == false{
                fjump()
                if(player.position.y > 6820 && player.position.y < 16000){
                    let slowedJumpAction = SKAction.moveBy(x: 0, y: 100, duration: 0.6)
                    player.run(slowedJumpAction)
                }
                else if(player.position.y >= 16000 && player.position.y < 19000){
                    let fastJumpAction = SKAction.moveBy(x: 0, y: 100, duration: 0.15)
                    player.run(fastJumpAction)
                }
                else if(player.position.y >= 20800 && player.position.y < 31000){
                    let spaceJumpAction = SKAction.moveBy(x: 0, y: 300, duration: 0.9)
                    player.run(spaceJumpAction)
                }
                else{
                    let jumpAction = SKAction.moveBy(x: 0, y: 100, duration: 0.3)
                    player.run(jumpAction)
                }
            }
        }
    }
    
    func jumpDown(){
        if restricted == false{
            if gameOver == false{
                fjump()
                if(player.position.y > 6820 && player.position.y < 16000){
                    let slowedJumpAction = SKAction.moveBy(x: 0, y: -100, duration: 0.6)
                    player.run(slowedJumpAction)
                }
                else if(player.position.y >= 16000 && player.position.y < 19000){
                    let fastJumpAction = SKAction.moveBy(x: 0, y: -100, duration: 0.15)
                    player.run(fastJumpAction)
                }
                else if(player.position.y >= 20800 && player.position.y < 31000){
                    let spaceJumpAction = SKAction.moveBy(x: 0, y: -300, duration: 0.9)
                    player.run(spaceJumpAction)
                }
                else{
                    let jumpAction = SKAction.moveBy(x: 0, y: -100, duration: 0.3)
                    player.run(jumpAction)
                }
            }
        }
    }
    
    func jumpLeft(){
        if restricted == false{
            if gameOver == false{
                sjump()
                if(player.position.y > 6820 && player.position.y < 16000){
                    let slowedJumpAction = SKAction.moveBy(x: -100, y: 0, duration: 0.35)
                    player.run(slowedJumpAction)
                }
                else if(player.position.y >= 16000 && player.position.y < 19000){
                    let fastJumpAction = SKAction.moveBy(x: -100, y: 0, duration: 0.075)
                    player.run(fastJumpAction)
                }
                else {
                    let jumpAction = SKAction.moveBy(x: -100, y: 0, duration: 0.15)
                    player.run(jumpAction)
                }
            }
        }
    }
    
    func jumpRight(){
//        let sidejump = SKAudioNode(fileNamed: "sidejump")
//        addChild(sidejump)
        if restricted == false{
            if gameOver == false{
                sjump()
                if(player.position.y > 6820 && player.position.y < 16000){
                    let slowedJumpAction = SKAction.moveBy(x: 100, y: 0, duration: 0.35)
                    player.run(slowedJumpAction)
                }
                else if(player.position.y >= 16000 && player.position.y < 19000){
                    let fastJumpAction = SKAction.moveBy(x: 100, y: 0, duration: 0.075)
                    player.run(fastJumpAction)
                }
                else{
                    let jumpAction = SKAction.moveBy(x: 100, y: 0, duration: 0.15)
                    player.run(jumpAction)
                }
            }
        }
    }
    
    
    
    func GameOver(){
        player.physicsBody?.velocity.dy = 0
        player.physicsBody?.velocity.dx = 0
    }
    
    func restart(){
        player.physicsBody?.velocity.dx = 0
        player.physicsBody?.velocity.dy = 0
        gameOver = false
        winLoseOutlet.text = ""
        player.physicsBody?.friction = 0
        player.zPosition = 1
        player.zRotation = 0
        player.physicsBody?.allowsRotation = false
        player.position.y = 0
        player.position.x = 0
        invisFollower.position.y = player.position.y
        invisFollower.position.x = player.position.x
        player.removeAllActions()
        let rotateAction = SKAction.rotate(toAngle: 0, duration: 0)
        player.run(rotateAction)
        player.physicsBody?.allowsRotation = false
        invisFollower.removeAllActions()
        gameTimer = 0
        lives = 15
        trueCheckpoint = 0
        car6.position.x = -4000
        car6.physicsBody?.velocity.dx = 0
        farDeadd = false
    }
    

    func sjump(){
//        let sjump = SKAudioNode(fileNamed: "sidejump")
//        addChild(sjump)
        player.run(SKAction.playSoundFileNamed("sidejump",waitForCompletion:false));

    }
    func fjump(){
//        let fjump = SKAudioNode(fileNamed: "fowardjump")
//        addChild(fjump)
        
        player.run(SKAction.playSoundFileNamed("fowardjump",waitForCompletion:false));
        
    }
    func deathaffect(){
        var randomInt = Int.random(in : 1...7)
                var deathsoundOfChoice = deathsoundnums[randomInt]
                player.run(SKAction.playSoundFileNamed("\(deathsoundOfChoice)",waitForCompletion:false));

    }
    
    func teleportLastCheckpoint(){
        player.physicsBody?.velocity.dx = 0
        player.physicsBody?.velocity.dy = 0
        player.physicsBody?.friction = 0
        player.zPosition = 1
        //player.position.y = (CGFloat)(lastCheckpoint)
        player.removeAllActions()
        let tpBack = SKAction.moveTo(y: (CGFloat)(trueCheckpoint), duration: 0)
        player.run(tpBack)
        let tpBackX = SKAction.moveTo(x: 0, duration: 0)
        player.run(tpBackX)
        player.position.x = 0
        invisFollower.position.y = player.position.y

        invisFollower.removeAllActions()
        
    }
    
    
    func trueCheck(){
        if(trueCheckpoint < lastCheckpoint){
            trueCheckpoint = lastCheckpoint
        }
        
    }
    
    
    func muteSound(){
        
            if AppData.mutebutt == 0{
                addChild(backgroundmusic)
                print("playing")
            }
            else if AppData.mutebutt == 1{
                backgroundmusic.run(SKAction.stop())
                print("muting")

            }
        }
    func playSound(){
        
            if AppData.muteclicked == 1{
                backgroundmusic.run(SKAction.play())
             print("playing")
            }
            else if AppData.mutebutt == 0{
                backgroundmusic.run(SKAction.stop())
                print("muting")

            }
        }

    
    
}
