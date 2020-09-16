//
//  ArithmeticChallengeViewController.swift
//  Challenge
//
//  Created by Dina Mansour on 11/24/19.
//  Copyright © 2019 Dina Mansour. All rights reserved.
//

import UIKit

class ArithmeticChallengeViewController: AppBaseViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
      
      override func viewWillAppear(_ animated: Bool) {
          setNeedsStatusBarAppearanceUpdate()
         
          self.navigationItem.title = "Arithmetic Challenge"
         
      }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }




}
