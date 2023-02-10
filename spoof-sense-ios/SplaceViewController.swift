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
    @IBOutlet weak var lblVersionNumber: UILabel!
    @IBOutlet weak var btnCheckLiveness: UIButton!
    
    var resultCameraVM = ResultCameraViewModel()
    
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
        imageViewLogo.image = SetCustomUI.shared.appLogo
        lblFirstName.text = SetCustomUI.shared.appFirstName
        lblLastName.text = SetCustomUI.shared.appLastName
        lblVersionNumber.text = SetCustomUI.shared.versionNumberString
        lblFirstName.textColor = SetCustomUI.shared.appFirstNameColor
        lblLastName.textColor = SetCustomUI.shared.appLastNameColor
        lblVersionNumber.textColor = SetCustomUI.shared.versionNumberColor
        btnCheckLiveness.setTitle(SetCustomUI.shared.buttonTextTitle, for: .normal)
        btnCheckLiveness.setTitleColor(SetCustomUI.shared.buttonTitleColor, for: .normal)
        btnCheckLiveness.backgroundColor = SetCustomUI.shared.buttonBackgroundColor
    }
}

//MARK: Action
private extension SplaceViewController {
    @IBAction func onBtnCheckLiveness(_ sender: UIButton) {
        if SetCustomUI.shared.isShowGuidelinesVC {
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
