//
//  CameraViewController.swift
//  spoof-sense-ios
//
//  Created by iMac on 09/02/23.
//

import UIKit
import AVKit

public class CameraViewController: UIViewController {
    
    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var btnCapture: UIButton!
      
    var captureSession: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    var isSelectCustomUI = false

    var resultCameraVM = ResultCameraViewModel()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupCameraView()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupUI()
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.captureSession.stopRunning()
        captureSession = nil
        stillImageOutput = nil
        videoPreviewLayer = nil
    }
}

public extension CameraViewController {
    func setupCustomUI(with appLogo: UIImage, appFirstName: String, appFirstNameTitleColor: UIColor, appLastName: String, appLastNameTitleColor: UIColor, appTitle: String, buttonTitle: String = "Check Liveness", appTitleColor: UIColor, buttonBackgroundColor: UIColor, buttonTextColor: UIColor) {
        self.resultCameraVM.appLogo = appLogo
        self.resultCameraVM.appFirstName = appFirstName
        self.resultCameraVM.appLastName = appLastName
        self.resultCameraVM.appFirstNameColor = appFirstNameTitleColor
        self.resultCameraVM.appLastNameColor = appLastNameTitleColor
        self.resultCameraVM.appTitle = appTitle
        self.resultCameraVM.appTitleColor = appTitleColor
        self.resultCameraVM.btnTextTitle = buttonTitle
        self.resultCameraVM.btnTitleColor = buttonTextColor
        self.resultCameraVM.btnBackgroundColor = buttonBackgroundColor
        isSelectCustomUI = true
    }
}

private extension CameraViewController {
    func setupUI() {
        btnCapture.clipsToBounds = true
        btnCapture.layer.cornerRadius = btnCapture.bounds.height / 2
        btnCapture.backgroundColor = resultCameraVM.btnBackgroundColor
        setCustomUI()
    }
    
    func setCustomUI() {
        if isSelectCustomUI {
            btnCapture.backgroundColor = self.resultCameraVM.btnBackgroundColor
        }
    }
    
    func setupCameraView() {
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .medium
        
        guard let backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
        else {
            print("Unable to access back camera!")
            return
        }
        do {
            let input = try AVCaptureDeviceInput(device: backCamera)
            stillImageOutput = AVCapturePhotoOutput()
            if captureSession.canAddInput(input) && captureSession.canAddOutput(stillImageOutput) {
                captureSession.addInput(input)
                captureSession.addOutput(stillImageOutput)
                setupLivePreview()
            }
        }
        catch let error  {
            print("Error Unable to initialize back camera:  \(error.localizedDescription)")
        }
    }
    
    func setupLivePreview() {
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer.videoGravity = .resizeAspectFill//.resizeAspect
        videoPreviewLayer.connection?.videoOrientation = .portrait
        previewView.layer.addSublayer(videoPreviewLayer)
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.captureSession.startRunning()
            DispatchQueue.main.async {
                self.videoPreviewLayer.frame = self.previewView.bounds
            }
        }
    }
    
    func goToResultView() {
        let podBundle = Bundle(for: ResultViewController.self)
        let storyBoard = UIStoryboard.init(name: "SpoofSense", bundle: podBundle)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController
        vc?.resultCameraVM = self.resultCameraVM
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

private extension CameraViewController {
    @IBAction func didTakePhoto(_ sender: UIButton) {
        let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
        stillImageOutput.capturePhoto(with: settings, delegate: self)
    }
}

extension CameraViewController: AVCapturePhotoCaptureDelegate {
    public func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
//        guard let imageData = photo.fileDataRepresentation(), let image = UIImage(data: imageData), let dataImage = image.jpegData(compressionQuality: 0.5)
        guard let imageData = photo.fileDataRepresentation(), let image = UIImage(data: imageData)
        else { return }
        let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        self.resultCameraVM.base64ImageData = strBase64
        self.goToResultView()
    }
}
