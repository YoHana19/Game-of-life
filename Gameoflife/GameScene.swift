//
//  GameScene.swift
//  Gameoflife
//
//  Created by yo hanashima on 2017/06/13.
//  Copyright © 2017年 yo hanashima. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    /* UI Objects */
//    var stepButton: MSButtonNode!
//    var playButton: MSButtonNode!
//    var pauseButton: MSButtonNode!
    var populationLabel: SKLabelNode!
    var generationLabel: SKLabelNode!
    
    /* Game objects */
    var gridNode: Grid!
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        
//        /* Set UI connections */
//        stepButton = self.childNode(withName: "stepButton") as! MSButtonNode
//        
//        /* Setup testing button selected handler */
//        stepButton.selectedHandler = {
//            self.stepSimulation()
//        }
        
//        playButton = self.childNode(withName: "playButton") as! MSButtonNode
//        pauseButton = self.childNode(withName: "pauseButton") as! MSButtonNode
        populationLabel = self.childNode(withName: "populationLabel") as! SKLabelNode
        generationLabel = self.childNode(withName: "generationLabel") as! SKLabelNode
        
        gridNode = self.childNode(withName: "gridNode") as! Grid
        
        /* Create an SKAction based timer, 0.5 second delay */
        let delay = SKAction.wait(forDuration: 0.5)
        
        /* Call the stepSimulation() method to advance the simulation */
        let callMethod = SKAction.perform(#selector(GameScene.stepSimulation), onTarget: self)
        
        /* Create the delay,step cycle */
        let stepSequence = SKAction.sequence([delay,callMethod])
        
        /* Create an infinite simulation loop */
        let simulation = SKAction.repeatForever(stepSequence)
        
        /* Run simulation action */
        self.run(simulation)
        
        /* Default simulation to pause state */
        self.isPaused = false

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func stepSimulation() {
        /* Step Simulation */
        
        /* Run next step in simulation */
        gridNode.evolve()
        
        /* Update UI label objects */
        populationLabel.text = String(gridNode.population)
        generationLabel.text = String(gridNode.generation)
    }
}
