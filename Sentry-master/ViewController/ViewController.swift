//
//  ViewController.swift
//  Sentry-master
//
//  Created by Sergey Leskov on 11/21/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import UIKit
import Sentry

class ViewController: UIViewController {
    
    //==================================================
    // MARK: - Stored Properties
    //==================================================
    let zeroSegue = "ziro"
    let userService = UserServiceFactory.shared.createUserService()
    
    //==================================================
    // MARK: - General
    //==================================================
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //==================================================
    // MARK: - Action
    //==================================================
    @IBAction func seagueButtonAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: self.zeroSegue, sender: nil)
    }
    
    @IBAction func crashButtonAction(_ sender: UIButton) {
        Client.shared?.crash()
    }
    
    
    @IBAction func addUserButtonAction(_ sender: UIButton) {
        
        let countUsers = userService.countUser()
        
        let user = userService.createUser(withName: "User\(countUsers + 1)", withId: Int(countUsers) + 1)
        print(user?.userName ?? "?")
        
    }
    
    
    @IBAction func deleteUserButtonAction(_ sender: UIButton) {
        let isDelete = userService.deleteLastUser()
        print(isDelete)
    }
    
    
    @IBAction func testPrintButtonAction(_ sender: UIButton) {
        myPrint(text: "test")
    }
    
    
    
}
