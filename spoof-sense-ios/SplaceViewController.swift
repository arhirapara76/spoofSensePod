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
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
}

private extension SplaceViewController {
    func setupUI() {
        btnCheckLiveness.clipsToBounds = true
        btnCheckLiveness.layer.cornerRadius = 4
    }
}

public extension SplaceViewController {
    func setupCustomUI(with appLogo: UIImage, appFirstName: String, appLastName: String, appTitle: String, buttonTitle: String = "Check Liveness", buttonBackgroundColor: UIColor, buttonTextColor: UIColor, isShowGuidelinesScreen: Bool = true) {
        imageViewLogo.image = appLogo
        lblFirstName.text = appFirstName
        lblLastName.text = appLastName
        lblTitle.text = appTitle
        btnCheckLiveness.setTitle(buttonTitle, for: .normal)
        btnCheckLiveness.setTitleColor(buttonTextColor, for: .normal)
        btnCheckLiveness.backgroundColor = buttonBackgroundColor
        self.resultCameraVM.btnTextTitle = buttonTitle
        self.resultCameraVM.btnTitleColor = buttonTextColor
        self.resultCameraVM.btnBackgroundColor = buttonBackgroundColor
        self.resultCameraVM.isShowGuidelinesVC = isShowGuidelinesScreen
    }
}

//MARK: Action
private extension SplaceViewController {
    @IBAction func onBtnCheckLiveness(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "SpoofSense", bundle: Bundle.main).instantiateViewController(withIdentifier: "FaceGuidelinesViewController") as? FaceGuidelinesViewController
        vc?.resultCameraVM = self.resultCameraVM
        self.navigationController?.pushViewController(vc!, animated: true)

    }
}
