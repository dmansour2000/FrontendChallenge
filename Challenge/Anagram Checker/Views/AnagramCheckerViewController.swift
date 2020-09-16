//
//  AnagramCheckerViewController.swift
//  Challenge
//
//  Created by Dina Mansour on 11/24/19.
//  Copyright © 2019 Dina Mansour. All rights reserved.
//

import UIKit
import SideMenu

class AnagramCheckerViewController: AppBaseViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var checkAnagramBTN: UIButton!
    
    @IBOutlet weak var firstStringTextField: UITextField!
    
    @IBOutlet weak var secondStringTextField: UITextField!
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
                self.navigationItem.title = "Anagram Checker"
                
                checkAnagramBTN.roundCorners(corners: UIRectCorner(rawValue: 15), radius: 15)
                                  // .Selected
                                     let mySelectedAttributedTitle = NSAttributedString(string: "Check Anagram",
                                                                                        attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
                                     checkAnagramBTN.setAttributedTitle(mySelectedAttributedTitle, for: .selected)

                                     // .Normal
                                     let myNormalAttributedTitle = NSAttributedString(string: "Check Anagram",
                                                                                      attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])


                                 checkAnagramBTN.setAttributedTitle(myNormalAttributedTitle, for: .normal)
                             
               firstStringTextField.addGreyBottomBorder(string: "First String")
               secondStringTextField.addGreyBottomBorder(string: "Second String")
                answerLabel.text = ""
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      setupSideMenu()
      let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AnagramCheckerViewController.tapRecognized))
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


    @IBAction func checkAnagram(_ sender: Any) {
        
        if (firstStringTextField.text != "" && secondStringTextField.text != ""){
            
            var a = firstStringTextField.text!.lowercased()
            var b = secondStringTextField.text!.lowercased()
            a = a.trimmingCharacters(in: .whitespacesAndNewlines)
            b = b.trimmingCharacters(in: .whitespacesAndNewlines)
            a = a.trimmingCharacters(in: CharacterSet.punctuationCharacters)
            b = b.trimmingCharacters(in: CharacterSet.punctuationCharacters)
            var sorteda: [Character] = []
            var sortedb: [Character] = []
            for i in 0...(a.count-1){
              let index =  a.index(a.startIndex, offsetBy: i)
                if (a[index] != " " ){
                    sorteda.append(a[index])
                }
            }
            for  x in 0...(b.count-1){
                            
                let index =  b.index(b.startIndex, offsetBy: x)
   
                if (b[index] != " " ){
                sortedb.append(b[index])
                }
                
                }
            
            
            sorteda.sort()
            sortedb.sort()
            
            if (sorteda == sortedb){
                answerLabel.text = "The two strings entered are anagrams"
            }else{
                answerLabel.text = "The two strings entered are NOT anagrams"
            }
            
        }else{
            showErrorMessage("Please enter first and second strings!")
        }
        
    }
    
}
