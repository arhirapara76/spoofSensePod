//
//  FaceGuidelinesViewController.swift
//  spoof-sense-ios
//
//  Created by iMac on 09/02/23.
//

import UIKit

public class FaceGuidelinesViewController: UIViewController {
    
    @IBOutlet weak var btnCheckLiveness: UIButton!

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
        btnCheckLiveness.setTitle(self.resultCameraVM.btnTextTitle, for: .normal)
        btnCheckLiveness.setTitleColor(self.resultCameraVM.btnTitleColor, for: .normal)
        btnCheckLiveness.backgroundColor = self.resultCameraVM.btnBackgroundColor
    }
}

public extension FaceGuidelinesViewController {
    func setupCustomUI(with appLogo: UIImage, appFirstName: String, appLastName: String, appTitle: String, buttonTitle: String = "Check Liveness", buttonBackgroundColor: UIColor, buttonTextColor: UIColor, isShowGuidelinesScreen: Bool = true) {
        btnCheckLiveness.setTitle(buttonTitle, for: .normal)
        btnCheckLiveness.setTitleColor(buttonTextColor, for: .normal)
        btnCheckLiveness.backgroundColor = buttonBackgroundColor
        self.resultCameraVM.btnTextTitle = buttonTitle
        self.resultCameraVM.btnTitleColor = buttonTextColor
        self.resultCameraVM.btnBackgroundColor = buttonBackgroundColor
    }
}

private extension FaceGuidelinesViewController {
    @IBAction func onBtnCheckLiveness(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "SpoofSense", bundle: Bundle.main).instantiateViewController(withIdentifier: "CameraViewController") as? CameraViewController
        vc?.resultCameraVM = self.resultCameraVM
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
