//
//  ViewController.swift
//  testttttttttttt
//
//  Created by integration on 25/05/2018.
//  Copyright © 2018 integration. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class FourthArViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/keyCollada.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
        
        // addBox()
        // addTapGestureToSceneView()
        // addText()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    
    // func addBox(x: Float = 0, y: Float = 0, z: Float = -0.2) {
    //    let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
    
    //   let boxNode = SCNNode()
    // boxNode.geometry = box
    //boxNode.position = SCNVector3(x, y, z)
    
    // sceneView.scene.rootNode.addChildNode(boxNode)
    // }
    
    
    
    // func addTapGestureToSceneView() {
    //    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap(withGestureRecognizer:)))
    //    sceneView.addGestureRecognizer(tapGestureRecognizer)
    // }
    
    // @objc func didTap(withGestureRecognizer recognizer: UIGestureRecognizer) {
    //   let tapLocation = recognizer.location(in: sceneView)
    //  let hitTestResults = sceneView.hitTest(tapLocation)
    //  guard let node = hitTestResults.first?.node else {
    //     let hitTestResultsWithFeaturePoints = sceneView.hitTest(tapLocation, types: .featurePoint)
    //    if let hitTestResultWithFeaturePoints = hitTestResultsWithFeaturePoints.first {
    //       let translation = hitTestResultWithFeaturePoints.worldTransform.translation
    //       addBox(x: translation.x, y: translation.y, z: translation.z)
    //  }
    //   return
    //}
    //node.removeFromParentNode()
    // }
    
    // func addText() {
    
    //    let pasword = SCNText(string: "#EHB", extrusionDepth: 1.0)
    
    //     let material = SCNMaterial()
    //    material.diffuse.contents = UIColor.green
    //    pasword.materials = [material]
    
    
    
    
    // let nodePass = SCNNode()
    //nodePass.position = SCNVector3(x:0, y:0.5, z:-0.1)
    //nodePass.scale = SCNVector3(x:0.001, y:0.001, z:0.01)
    //nodePass.rotation = SCNVector4(1.5, 0, 0, 1)
    //nodePass.geometry = pasword
    
    //  sceneView.scene.rootNode.addChildNode(nodePass)
    // sceneView.autoenablesDefaultLighting = true
    
}

// MARK: - ARSCNViewDelegate

/*
 // Override to create and configure nodes for anchors added to the view's session.
 func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
 let node = SCNNode()
 
 return node
 }
 */





