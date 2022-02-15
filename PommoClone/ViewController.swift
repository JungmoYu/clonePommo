//
//  ViewController.swift
//  PommoClone
//
//  Created by Jungmo Yu on 2022/02/14.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - IBOutlet
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var addProjectBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initViews()
    }
    
    func initViews() {
        self.backgroundView.layer.cornerRadius = 15
        self.addProjectBtn.layer.cornerRadius = 15
    }

    
    // MARK: - IBAction methods
    @IBAction func addProjectBtnClicked(_ sender: UIButton) {
        
        
        let storyBoard = UIStoryboard.init(name: "PopUp", bundle: nil)
        let PopUpVC = storyBoard.instantiateViewController(withIdentifier: "PopUp")
        
        PopUpVC.modalPresentationStyle = .overCurrentContext
        PopUpVC.modalTransitionStyle = .crossDissolve
        
        self.present(PopUpVC, animated: true, completion: nil)
        
    }
    
}

