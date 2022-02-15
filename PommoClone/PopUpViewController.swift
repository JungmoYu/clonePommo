//
//  PopUpViewController.swift
//  PommoClone
//
//  Created by Jungmo Yu on 2022/02/15.
//

import UIKit

class PopUpViewController: UIViewController {
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var backGroundBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    var delegate: PopUpViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    func initViews() {
        popUpView.layer.cornerRadius = 15
        cancelBtn.layer.cornerRadius = 15
        saveBtn.layer.cornerRadius = 15
    }
    
    
    @IBAction func backGroundBtnClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelBtnClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtnClicked(_ sender: UIButton) {
        var projectName: String
        
        if let projectNameOptional = self.textField.text {
            projectName = projectNameOptional
        } else {
            projectName = "Unknown Project"
        }
        
        self.delegate?.passText(projectName)
        self.dismiss(animated: true, completion: nil)
    }
    
    
}


protocol PopUpViewControllerDelegate {
    func passText(_ text: String)
}
