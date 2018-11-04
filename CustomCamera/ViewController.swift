//
//  ViewController.swift
//  CustomCamera
//
//  Created by Rinni Swift on 11/3/18.
//  Copyright © 2018 Rinni Swift. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var captureSession = AVCaptureSession()
    var backCamera: AVCaptureDevice?
    var fronCamera: AVCaptureDevice?
    var currentCamera: AVCaptureDevice?
    
    var photoOutput: AVCapturePhotoOutput?
    
    @IBAction func cameraButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "showPhotoSegue", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        startRunningCaptureSession()
        
    }
    
    func setupCaptureSession() {
        // AVCaptureSession to get full resolution/quality of the photo.
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
    }
    
    func setupDevice() {
        // use discoverySession on AVCaptureDevice with the discoverySession class to find available capture devices
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        // front and back cameras
        let devices = deviceDiscoverySession.devices
        for device in devices {
            if device.position == AVCaptureDevice.Position.back {
                backCamera = device
            } else if device.position == AVCaptureDevice.Position.front  {
                fronCamera = device
            }
        }
        
        currentCamera = backCamera
        
        
    }
    
    func setupInputOutput() {
        // connect the captureDeviceInput to the captureDeviceSession
        do {
            // configure input device
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
            // provide input into the captureSessoin
            captureSession.addInput(captureDeviceInput)
            // configure photOutput
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
        } catch {
            print(error)
        }
        
    }
    
    func setupPreviewLayer() {
        
    }
    
    func startRunningCaptureSession() {
        
    }

}

