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
        let userService = UserServiceFactory.shared.createUserService(kindService: .coreData)
        let countUsers = userService.countUser()
        
        userService.createUser(withName: "User\(countUsers + 1)", withId: Int(countUsers) + 1) { (error, userProtocol) in
            print(userProtocol?.userName ?? "?")
        }
    }
    
    
    @IBAction func deleteUserButtonAction(_ sender: UIButton) {
        let userService = UserServiceFactory.shared.createUserService(kindService: .coreData)
        let deleteRezult = userService.deleteLastUser()
        print(deleteRezult)
    }
    
    @IBAction func printNormalButtonAction(_ sender: UIButton) {
        myPrint("test", call: self)
    }
    
    
    @IBAction func printErrorButtonAction(_ sender: UIButton) {
        myPrint("test", call: self, kind: .error)
    }
    
    
    @IBAction func addUserFirestoreButton(_ sender: UIButton) {
        let userService = UserServiceFactory.shared.createUserService(kindService: .firestore)
        let countUsers = userService.countUser()
        
        userService.createUser(withName: "User\(countUsers + 1)", withId: Int(countUsers) + 1) { (error, userProtocol) in
            if error != nil {
                myPrint(String(describing: error), call: self, kind: .error)
                return
            }
            print(userProtocol?.userName ?? "?")
        }

    }
    
}
