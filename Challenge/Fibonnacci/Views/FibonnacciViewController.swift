//
//  FibonnacciViewController.swift
//  Challenge
//
//  Created by Dina Mansour on 11/24/19.
//  Copyright © 2019 Dina Mansour. All rights reserved.
//

import UIKit
import SideMenu

class FibonnacciViewController: AppBaseViewController {

    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var iterativeBTN: UIButton!
    @IBOutlet weak var recursiveBTN: UIButton!
    override var preferredStatusBarStyle: UIStatusBarStyle {
               return .lightContent
           }
         
         override func viewWillAppear(_ animated: Bool) {
             setNeedsStatusBarAppearanceUpdate()
            let btn1 = UIButton()
                   btn1.setImage(UIImage(named: "menu"), for: .normal)
                   btn1.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
                   btn1.addTarget(self, action: #selector(openSideMenu(_:)), for: .touchUpInside)
                   let customView = UIView()
                   customView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
                   customView.addSubview(btn1)
                   self.navigationItem.setLeftBarButton(UIBarButtonItem(customView: customView), animated: true);
             self.navigationItem.title = "nth Fibonnacci Number"
            
            iterativeBTN.roundCorners(corners: UIRectCorner(rawValue: 15), radius: 15)
                   // .Selected
                      let mySelectedAttributedTitle = NSAttributedString(string: "Iterative Approach",
                                                                         attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
                      iterativeBTN.setAttributedTitle(mySelectedAttributedTitle, for: .selected)

                      // .Normal
                      let myNormalAttributedTitle = NSAttributedString(string: "Iterative Approach",
                                                                       attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])


                  iterativeBTN.setAttributedTitle(myNormalAttributedTitle, for: .normal)
                  
                   recursiveBTN.roundCorners(corners: UIRectCorner(rawValue: 15), radius: 15)
                   // .Selected
                        let mySelectedAttributedTitle2 = NSAttributedString(string: "Recursive Approach",
                                                                           attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
                        recursiveBTN.setAttributedTitle(mySelectedAttributedTitle2, for: .selected)

                        // .Normal
                        let myNormalAttributedTitle2 = NSAttributedString(string: "Recursive Approach",
                                                                         attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])


                    recursiveBTN.setAttributedTitle(myNormalAttributedTitle2, for: .normal)
            answerLabel.text = ""
            numberTextField.addGreyBottomBorder(string: "nth Number")
         }
       
    
    override func viewDidLoad() {
        super.viewDidLoad()

    // Do any additional setup after loading the view.
    setupSideMenu()
    let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FibonnacciViewController.tapRecognized))
    singleTapGestureRecognizer.numberOfTapsRequired = 1
    singleTapGestureRecognizer.isEnabled = true
    singleTapGestureRecognizer.cancelsTouchesInView = false
    self.view.addGestureRecognizer(singleTapGestureRecognizer)
                  }

    @objc func tapRecognized() {
        view.endEditing(true)
                  }

    fileprivate func setupSideMenu() {
                 // Define the menus
                 
                 let leftViewController:SideMenuNavigationController = UIStoryboard(name: "SideMenu", bundle: nil).instantiateViewController(withIdentifier: "UISideMenuNavigationController") as! SideMenuNavigationController
                 SideMenuManager.default.leftMenuNavigationController = leftViewController
                 SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: self.view )
                 SideMenuManager.default.menuPresentMode = .menuSlideIn
                 SideMenuManager.default.menuAnimationBackgroundColor = UIColor.clear
                 SideMenuManager.default.menuWidth = 280
                 
             }

    @IBAction func openSideMenu(_ sender: Any) {
        present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
    }

    func validateNumber()->Bool{
        
        if !( UIHelper.isStringAnInt(stringNumber: numberTextField.text!) ){
            showErrorMessage("Please enter an Integer")
        }
        
        return UIHelper.isStringAnInt(stringNumber: numberTextField.text!)
        
    }
    @IBAction func recursiveApproach(_ sender: Any) {
        
       var fib: [Int] = []
       fib.append(1)
       fib.append(1)
       fib.append(2)
        if validateNumber(){
        let n = Int(numberTextField.text!)!
            if ( n >= 4){
         for i in 4...(n) {
             fib.append(fibonacciR(n: i))
            }
            }
        var answer = ""
            
            for i in 0..<(n){
          
                if i==0{
                    answer += "\(fib[i])"
                }else{
                    answer += ", \(fib[i])"
                }
        }
            
       answerLabel.text = answer
        }
        
    }
    
    func fibonacciR(n: Int) -> Int {
        if (n == 0){
            return 0
        } else if (n == 1) {
            return 1
        }
        return fibonacciR(n: n-1) + fibonacciR(n: n-2)
    }
    
    @IBAction func iterativeApproach(_ sender: Any) {
        
       
        
         if validateNumber(){
            answerLabel.text = fibonacciI(n: Int(numberTextField.text!)!)
               }
        
    }
    func fibonacciI(n: Int) -> String {
        var f1=1, f2=1, fib=0
        var answer = "1"
        if (n > 1 && n <= 2){
           answer = "1, 1"
        }
        else if (n > 2){
            answer = "1, 1"
            for _ in 3...n {
            fib = f1 + f2
            answer += ", \(fib)"
            f1 = f2
            f2 = fib
        }
        }
        return answer
    }
}
