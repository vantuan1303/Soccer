//
//  ViewController.swift
//  Soccer
//
//  Created by Nguyen Van Tuan on 1/15/17.
//  Copyright © 2017 MyProjects. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ball = UIImageView()
    var radians = CGFloat()
    var ballRadious = CGFloat()
    var direction = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
        _ = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: Selector("roolBall"), userInfo: nil, repeats: true)
    }

    func addBall() {
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ballRadious = 32
        ball.center = CGPointMake(ballRadious, self.view.bounds.size.height / 2)
        self.view.addSubview(ball)
    }
    
    
    func changeDirection() {
        let mainViewSize = self.view.bounds.size
        if (ball.center.x == 32) {
            direction = 0
            
        }
        if (ball.center.x == mainViewSize.width - 32) {
            direction = -1
        }
    }
    
    func roolBall() {
        let mainViewSize = self.view.bounds.size
        let deltaAngle: CGFloat = 0.1
        changeDirection()
        
        if direction == 0 && (ball.center.x + ballRadious * deltaAngle) > mainViewSize.width - 32 {
            ball.center = CGPointMake(mainViewSize.width - 32, ball.center.y)
            direction = 1
        }
        if direction == -1 && (ball.center.x - ballRadious * deltaAngle) < 32 {
            ball.center = CGPointMake(32, ball.center.y)
            direction = 1
        }
        if (direction == 0) {
            radians = radians + deltaAngle
            ball.transform = CGAffineTransformMakeRotation(radians)
            ball.center = CGPointMake(ball.center.x + ballRadious * deltaAngle, ball.center.y)
        }
        if (direction == -1) {
            radians = radians - deltaAngle
            ball.transform = CGAffineTransformMakeRotation(radians)
            ball.center = CGPointMake(ball.center.x - ballRadious * deltaAngle, ball.center.y)
        }
    }

}

