//
//  ResultViewController.swift
//  spoof-sense-ios
//
//  Created by iMac on 09/02/23.
//

import UIKit

public class ResultViewController: UIViewController {

    var resultCameraVM = ResultCameraViewModel()
   
    @IBOutlet weak var viewShowMessgae: UIView!
    @IBOutlet weak var imageViewLogo: UIImageView!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var activityIndicatorResult: UIActivityIndicatorView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
}

private extension ResultViewController {
    func setupUI() {
        self.hideLoader()
        self.viewShowMessgae.isHidden = true
        self.callImageResultApi()
        btnHome.clipsToBounds = true
        btnHome.layer.cornerRadius = 4
        btnHome.setTitleColor(self.resultCameraVM.btnTitleColor, for: .normal)
        btnHome.backgroundColor = resultCameraVM.btnBackgroundColor
    }
    
    func showLoader() {
        activityIndicatorResult.isHidden = false
        activityIndicatorResult.startAnimating()
    }
    
    func hideLoader() {
        activityIndicatorResult.isHidden = true
        activityIndicatorResult.stopAnimating()
    }
    
    func showResultText(_ isSucess: Bool, message: String) {
        self.viewShowMessgae.isHidden = false
        lblText.text = message
        let podBundle = Bundle(for: ResultViewController.self)
        if isSucess {
            let image = UIImage(named: "ic_sucess", in: podBundle, compatibleWith: nil)
            imageViewLogo.image = image
        } else {
            let image = UIImage(named: "ic_faild", in: podBundle, compatibleWith: nil)
            imageViewLogo.image = image
        }
    }
}

private extension ResultViewController {
    @IBAction func onBtnGoToHome(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

private extension ResultViewController {
    func callImageResultApi() {
        self.showLoader()
        resultCameraVM.postURLSessionGetData { jsonData in
            self.hideLoader()
            self.showResultText(true, message: jsonData)
        } failure: { err in
            self.hideLoader()
            self.showResultText(false, message: err?.localizedDescription ?? "")
        }
    }
}
