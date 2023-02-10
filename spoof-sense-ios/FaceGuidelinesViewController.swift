//
//  FaceGuidelinesViewController.swift
//  spoof-sense-ios
//
//  Created by iMac on 09/02/23.
//

import UIKit

public class FaceGuidelinesViewController: UIViewController {
    
    @IBOutlet weak var btnCheckLiveness: UIButton!
    @IBOutlet weak var imageFaceTrueDetect: UIImageView!
    @IBOutlet weak var imageVuewNoFaceDetect: UIImageView!
    @IBOutlet weak var imageViewMultiFace: UIImageView!
    
    var resultCameraVM = ResultCameraViewModel()
    var isSelectCustomUI = false

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}

private extension FaceGuidelinesViewController {
    func setupUI() {
        btnCheckLiveness.clipsToBounds = true
        btnCheckLiveness.layer.cornerRadius = 4
        btnCheckLiveness.setTitle(self.resultCameraVM.btnTextTitle, for: .normal)
        btnCheckLiveness.setTitleColor(self.resultCameraVM.btnTitleColor, for: .normal)
        btnCheckLiveness.backgroundColor = self.resultCameraVM.btnBackgroundColor
        let podBundle = Bundle(for: FaceGuidelinesViewController.self)
        let image1 = UIImage(named: "ic_face_right", in: podBundle, compatibleWith: nil)
        let image2 = UIImage(named: "ic_wrong_face", in: podBundle, compatibleWith: nil)
        let image3 = UIImage(named: "ic_multi_face", in: podBundle, compatibleWith: nil)
        imageFaceTrueDetect.image = image1
        imageVuewNoFaceDetect.image = image2
        imageViewMultiFace.image = image3
        self.setCustomUI()
    }
    
    func setCustomUI() {
        if isSelectCustomUI {
            btnCheckLiveness.setTitle(self.resultCameraVM.btnTextTitle, for: .normal)
            btnCheckLiveness.setTitleColor(self.resultCameraVM.btnTitleColor, for: .normal)
            btnCheckLiveness.backgroundColor = self.resultCameraVM.btnBackgroundColor
        }
    }
}

public extension FaceGuidelinesViewController {
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

private extension FaceGuidelinesViewController {
    @IBAction func onBtnCheckLiveness(_ sender: UIButton) {
        let podBundle = Bundle(for: CameraViewController.self)
        let storyBoard = UIStoryboard.init(name: "SpoofSense", bundle: podBundle)
        let vc = storyBoard.instantiateViewController(withIdentifier: "CameraViewController") as? CameraViewController
        vc?.resultCameraVM = self.resultCameraVM
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
