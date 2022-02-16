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
    var timer: Timer?
    
    var minute: Int = 25
    var second: Int = 0
    
    let startTimeString: String = "25:00"
    
    
    // MARK: - IBOutlet
    @IBOutlet weak var addProjectBtn: UIButton!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var restOfTimeLabel: UILabel!
    @IBOutlet weak var hiddenHStack: UIStackView!
    
    @IBOutlet weak var startTimerBtn: UIButton!
    @IBOutlet weak var pauseTimerBtn: UIButton!
    @IBOutlet weak var stopTimerBtn: UIButton!
    
    
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
    
    func startProject(project: String) {
        changeAddProjectBtn()
        changeRestOfTimeLabel()
        changeProjectNameLabel(project)
    }
    
    func changeRestOfTimeLabel() {
        self.restOfTimeLabel.text = self.startTimeString
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
    
    func makeAndFireTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [ unowned self ] (timer: Timer) in
            self.second -= 1
            if self.second < 0 {
                self.second = 59
                self.minute -= 1
            }
            
            if self.second <= 0 && self.minute <= 0 {
                self.invalidateTimer()
                self.startTimerBtn.isSelected = false
                self.minute = 25
                self.second = 0
                self.startTimerBtn.isEnabled = true
            }
            
            self.updateRestOfTimeLabel()
        })
        
        self.timer?.fire()
    }
    
    func invalidateTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func updateRestOfTimeLabel() {
        let timelabelText: String = String(format: "%02ld:%02ld", self.minute, self.second)
        self.restOfTimeLabel.text = timelabelText
    }
    
    // MARK: - IBAction methods
    @IBAction func addProjectBtnClicked(_ sender: UIButton) {

        let storyBoard = UIStoryboard.init(name: "PopUp", bundle: nil)
        
        guard let popUpVC = storyBoard.instantiateViewController(withIdentifier: "PopUp") as? PopUpViewController else { return }
        
        popUpVC.delegate = self
        popUpVC.modalPresentationStyle = .overCurrentContext
        popUpVC.modalTransitionStyle = .crossDissolve
        
        
        self.present(popUpVC, animated: true, completion: nil)
        
    }
    
    @IBAction func startTimerBtnClicked(_ sender: UIButton) {
        
        if sender.isEnabled {
            sender.isEnabled = !sender.isEnabled
            self.makeAndFireTimer()
        }
        
        self.stopTimerBtn.isEnabled = true
        self.pauseTimerBtn.isEnabled = true
    }
    
    @IBAction func pauseTimerBtnClicked(_ sender: UIButton) {
        if sender.isEnabled {
            sender.isEnabled = !sender.isEnabled
            self.invalidateTimer()
        }
        
        self.startTimerBtn.isEnabled = true
        self.stopTimerBtn.isEnabled = true
        
    }
    
    @IBAction func stopTimerBtnClicked(_ sender: UIButton) {
        if sender.isEnabled {
            sender.isEnabled = !sender.isEnabled
            self.invalidateTimer()
        }
        
        self.startTimerBtn.isEnabled = true
        self.pauseTimerBtn.isEnabled = true
    }
    
}


    // MARK: - Delegate methods
extension ViewController: PopUpViewControllerDelegate {
    func passText(_ text: String) {
        self.startProject(project: text)
    }
}
