//
//  ViewController.swift
//  PommoClone
//
//  Created by Jungmo Yu on 2022/02/14.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - properties
    var isProjectExist: Bool = false
    var projectNameFromTextField: String?
    
    
    
    // MARK: - IBOutlet
    @IBOutlet weak var addProjectBtn: UIButton!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var restOfTimeLabel: UILabel!
    @IBOutlet weak var hiddenHStack: UIStackView!
    
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initViews()
    }
    
    
    // MARK: - Custom methods
    func initViews() {
        self.bgView.layer.cornerRadius = 15
        self.addProjectBtn.layer.cornerRadius = 15
        self.hiddenHStack.layer.cornerRadius = 15
        self.hiddenHStack.isHidden = true
    }
    
    func changeRestOfTimeLabel() {
        self.restOfTimeLabel.text = "XX분 XX초"
        self.restOfTimeLabel.font = .systemFont(ofSize: 25)
    }
    
    func changeProjectNameLabel(_ text: String) {
        self.projectNameLabel.text = text
        self.projectNameLabel.font = .systemFont(ofSize: 60, weight: .bold)
    }
    
    func changeAddProjectBtn() {
        self.addProjectBtn.isHidden = true
        self.hiddenHStack.isHidden = false
    }
    
    // MARK: - IBAction methods
    @IBAction func addProjectBtnClicked(_ sender: UIButton) {

        let storyBoard = UIStoryboard.init(name: "PopUp", bundle: nil)
//        let PopUpVC = storyBoard.instantiateViewController(withIdentifier: "PopUp") as! PopUpViewController
        
        guard let popUpVC = storyBoard.instantiateViewController(withIdentifier: "PopUp") as? PopUpViewController else { return }
        
        popUpVC.delegate = self
        popUpVC.modalPresentationStyle = .overCurrentContext
        popUpVC.modalTransitionStyle = .crossDissolve
        
        
        self.present(popUpVC, animated: true, completion: nil)
        
    }
    

}

extension ViewController: PopUpViewControllerDelegate {
    func passText(_ text: String) {
        self.changeProjectNameLabel(text)
        self.changeRestOfTimeLabel()
        self.changeAddProjectBtn()
    }
}
