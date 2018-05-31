//
//  QRReaderViewController.swift
//  LaFonderie
//
//  Created by Jorik Doudelet on 25/05/18.
//  Copyright © 2018 Gunnar Hemmeryckx. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation
class QRReaderViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate{

    @IBOutlet var mijnpreview: UIView!
    var mijncategorie = String()
    var stringUrlLink = String()
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        
        super.viewDidLoad()

        captureSession = AVCaptureSession()
        
        let videoCaptureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice!)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed();
            return;
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.ean8, AVMetadataObject.ObjectType.ean13, AVMetadataObject.ObjectType.pdf417,
                AVMetadataObject.ObjectType.qr]
        } else {
            failed()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession);
        previewLayer.frame = view.layer.bounds;
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill;
        view.layer.addSublayer(previewLayer);
        
        captureSession.startRunning();
    }
    
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (captureSession?.isRunning == false) {
            captureSession.startRunning();
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (captureSession?.isRunning == true) {
            captureSession.stopRunning();
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection){
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            let readableObject = metadataObject as! AVMetadataMachineReadableCodeObject;
            
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: readableObject.stringValue!);
        }
        
        dismiss(animated: true)
    }
    
    func found(code: String) {
        print(code)
       print(mijncategorie)
        if(mijncategorie == "Metaal" && code == "https://schooltv.nl/video/de-ijzeren-eeuw-de-industriele-revolutie-in-nederland/" || mijncategorie == "Hout" && code == "http://www.hout.com"  || mijncategorie == "Textiel" && code == "https://www.youtube.com/watch?v=w4gFwMh_l6k" || mijncategorie == "Voeding" && code == "https://www.visvim.tv/dissertations/product_introspection_coffee_roasting.html"){
          stringUrlLink = code
            performSegue(withIdentifier: "openQrScannerLink", sender: nil)
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "openQrScannerLink" {
            
            let mijndestination = segue.destination as! mijnWebviewController
            
            mijndestination.url = URL(string: stringUrlLink)
        }
        
        
    }
}

    /*
    var stringUrlLink = String()
    
    enum  mijnerror: Error {
        case geenCameraAvailable
        case videonietbeschikbaar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        do{
           try scandeQrCode()
        } catch{
            print("kon barcode niet lezen")
        }
 
        // Do any additional setup after loading the view.
    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

        func mijnoutput(_ captureOutput: AVCaptureOutput!, didOutputMetaDataObjects metadataObjects:[Any]!, from connection: AVCaptureConnection!){
            if metadataObjects.count > 0 {
                let  machineReadableCode = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
                if machineReadableCode.type == AVMetadataObject.ObjectType.qr {
                    stringUrlLink = machineReadableCode.stringValue!
                    performSegue(withIdentifier: "openQrScannerLink", sender: self)
                }
                
                
            }
            
            
        }
        func scandeQrCode() throws {
            let  mijnAVCaptureSessions = AVCaptureSession()
            
            guard  let mijnAVCaptureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
                print("geen camera")
                throw mijnerror.geenCameraAvailable
            }
            guard let mijnAVCaptureInput = try? AVCaptureDeviceInput(device: mijnAVCaptureDevice) else {
                print("Failed to init mijncamera")
                throw mijnerror.videonietbeschikbaar
            }
            
            let mijnAVCaptureMetadataOutput = AVCaptureMetadataOutput()
            mijnAVCaptureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            
            mijnAVCaptureSessions.addInput(mijnAVCaptureInput)
            mijnAVCaptureSessions.addOutput(mijnAVCaptureMetadataOutput)
            
            mijnAVCaptureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
         
            let mijnAVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer (session: mijnAVCaptureSessions)
            mijnAVCaptureVideoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            mijnAVCaptureVideoPreviewLayer.frame = mijnpreview.bounds
            
            self.mijnpreview.layer.addSublayer(mijnAVCaptureVideoPreviewLayer)
            
            mijnAVCaptureSessions.startRunning()
            
            
           
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            
            if segue.identifier == "openQrScannerLink" {
                
                let mijndestination = segue.destination as! mijnWebviewController
                
                mijndestination.url = URL(string: stringUrlLink)
            }
            
            
        }
        
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
 //   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

