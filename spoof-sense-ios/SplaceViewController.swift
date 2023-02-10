//
//  SplaceViewController.swift
//  spoof-sense-ios
//
//  Created by iMac on 09/02/23.
//

import UIKit

public class SplaceViewController: UIViewController {

    @IBOutlet weak var imageViewLogo: UIImageView!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnCheckLiveness: UIButton!
    
    var resultCameraVM = ResultCameraViewModel()
    var isSelectCustomUI = false
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
}

private extension SplaceViewController {
    func setupUI() {
        btnCheckLiveness.clipsToBounds = true
        btnCheckLiveness.layer.cornerRadius = 4
        let podBundle = Bundle(for: SplaceViewController.self)
        let image1 = UIImage(named: "ic_splace_logo", in: podBundle, compatibleWith: nil)
        imageViewLogo.image = image1
        self.setCustomUI()
    }
    
    func setCustomUI() {
        if isSelectCustomUI {
            imageViewLogo.image = self.resultCameraVM.appLogo
            lblFirstName.text = self.resultCameraVM.appFirstName
            lblLastName.text = self.resultCameraVM.appLastName
            lblTitle.text = self.resultCameraVM.appTitle
            btnCheckLiveness.setTitle(self.resultCameraVM.btnTextTitle, for: .normal)
            btnCheckLiveness.setTitleColor(self.resultCameraVM.btnTitleColor, for: .normal)
            btnCheckLiveness.backgroundColor = self.resultCameraVM.btnBackgroundColor
        }
    }
}

public extension SplaceViewController {
    func setupCustomUI(with appLogo: UIImage, appFirstName: String, appFirstNameTitleColor: UIColor, appLastName: String, appLastNameTitleColor: UIColor, appTitle: String, buttonTitle: String = "Check Liveness", appTitleColor: UIColor, buttonBackgroundColor: UIColor, buttonTextColor: UIColor, isShowGuidelinesScreen: Bool = true) {
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
        self.resultCameraVM.isShowGuidelinesVC = isShowGuidelinesScreen
        isSelectCustomUI = true
    }
}

//MARK: Action
private extension SplaceViewController {
    @IBAction func onBtnCheckLiveness(_ sender: UIButton) {
        if self.resultCameraVM.isShowGuidelinesVC {
            let podBundle = Bundle(for: FaceGuidelinesViewController.self)
            let storyBoard = UIStoryboard.init(name: "SpoofSense", bundle: podBundle)
            let vc = storyBoard.instantiateViewController(withIdentifier: "FaceGuidelinesViewController") as? FaceGuidelinesViewController
            vc?.resultCameraVM = self.resultCameraVM
            self.navigationController?.pushViewController(vc!, animated: true)
        } else {
            let podBundle = Bundle(for: CameraViewController.self)
            let storyBoard = UIStoryboard.init(name: "SpoofSense", bundle: podBundle)
            let vc = storyBoard.instantiateViewController(withIdentifier: "CameraViewController") as? CameraViewController
            vc?.resultCameraVM = self.resultCameraVM
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}
