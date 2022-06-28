//
//  ViewController.swift
//  EngineeringProject
//
//  Created by Batuhan Satilmis on 17.04.2022.
//

import UIKit
import AVKit
import Vision

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBOutlet weak var belowView: UIView!
    
    @IBOutlet weak var objectNameLabel: UILabel!
    
    @IBOutlet weak var accuracyLabel: UILabel!
    
    
    
    var model = Resnet50().model
    
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let captureSession = AVCaptureSession()
                
                guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
                guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
                captureSession.addInput(input)
                
                captureSession.startRunning()
                
                let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                view.layer.addSublayer(previewLayer)
                previewLayer.frame = view.frame
                // The camera is now created!
        view.addSubview(belowView)
               
               belowView.clipsToBounds = true
               belowView.layer.cornerRadius = 15.0
               belowView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
               
               
               let  dataOutput = AVCaptureVideoDataOutput()
               dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
               captureSession.addOutput(dataOutput)
    }
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
            guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
            
        guard let model = try? VNCoreMLModel(for: model) else { return }
            let request = VNCoreMLRequest(model: model) { (finishedReq, err) in
                
                guard let results = finishedReq.results as? [VNClassificationObservation] else {return}
                guard let firstObservation = results.first else {return}
                
                let name: String = firstObservation.identifier
                let acc: Int = Int(firstObservation.confidence * 100)
                
                DispatchQueue.main.async {
                    self.objectNameLabel.text = name
                    self.accuracyLabel.text = "Accuracy: \(acc)%"
                }
                
            }
            
            try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
            
        }

    @IBAction func VoiceCommand(_ sender: Any) {
        VoiceCommandText(content: objectNameLabel.text! + "And It is" + accuracyLabel.text!)
        
    }
    

    
}

