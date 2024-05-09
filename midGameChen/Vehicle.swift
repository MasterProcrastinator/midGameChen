//
//  Vehicle.swift
//  midGameChen
//
//  Created by OLIVER MURRAY on 4/19/24.
//


import Foundation
public class Vehicle{
    var image : String = ""
    var width: Int
    var height: Int
    var mass = 10000
    
    var dx: Int
    var dy: Int
    var x: Double
   
    


    
    public init(image: String, width: Int, height: Int, dx: Int, dy: Int, x: Double) {
        self.image = image
        self.width = width
        self.height = height
        self.dx = dx
        self.dy = dy
        self.x = x
    }
    }
