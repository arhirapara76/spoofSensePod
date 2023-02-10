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

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}

private extension FaceGuidelinesViewController {
    func setupUI() {
        btnCheckLiveness.clipsToBounds = true
        btnCheckLiveness.layer.cornerRadius = 4
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
        btnCheckLiveness.setTitle(SetCustomUI.shared.buttonTextTitle, for: .normal)
        btnCheckLiveness.setTitleColor(SetCustomUI.shared.buttonTitleColor, for: .normal)
        btnCheckLiveness.backgroundColor = SetCustomUI.shared.buttonBackgroundColor
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
