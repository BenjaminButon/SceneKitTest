//
//  GameViewController.swift
//  SceneKitTest
//
//  Created by Benko Ostap on 05.06.18.
//  Copyright © 2018 Ostap Benko. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    var scnView: SCNView!
    var scnScene: SCNScene!
    var cameraNode: SCNNode!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupScene()
        setupCamera()
        spawnShape()
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    func setupView(){
        self.scnView = self.view as! SCNView
        scnView.showsStatistics = true
        scnView.allowsCameraControl = true
        scnView.autoenablesDefaultLighting = true
    }
    func setupScene(){
        self.scnScene = SCNScene()
        self.scnView.scene = scnScene
        scnScene.background.contents = "GeometryFighter.scnassets/Textures/Background_Diffuse.png"
    }
    func setupCamera(){
        self.cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 10)
        scnScene.rootNode.addChildNode(cameraNode)
    }
    func spawnShape(){
        var geometry: SCNGeometry
        switch ShapeType.random(){
        case .box:
            geometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
            break
        case .sphere:
            geometry = SCNSphere(radius: 1.0)
            break
        case .capsule:
            geometry = SCNCapsule(capRadius: 0.4, height: 5.0)
            break
        case .tube:
            geometry = SCNTube(innerRadius: 1.0, outerRadius: 0.5, height: 5.0)
            break
        case .cone:
            geometry = SCNCone(topRadius: 0.0, bottomRadius: 1.0, height: 5.0)
            break
        case .cylinder:
            geometry = SCNCylinder(radius: 0.7, height: 5.0)
            break
        case .pyramid:
            geometry = SCNPyramid(width: 2.5, height: 2.5, length: 5.0)
            break
        case .torus:
            geometry = SCNTorus(ringRadius: 1.0, pipeRadius: 0.5)
            break
        default:
            geometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        }
        let geometryNode = SCNNode(geometry: geometry)
        geometryNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        
        scnScene.rootNode.addChildNode(geometryNode)
    }
}
