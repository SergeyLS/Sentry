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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func button1Action(_ sender: UIButton) {
        performSegue(withIdentifier: "ziro", sender: nil)
    }
    
    
    @IBAction func button2Action(_ sender: UIButton) {
        Client.shared?.crash()
    }
    
    
    @IBAction func button3Action(_ sender: UIButton) {
        let moc = CoreDataManager.shared.viewContext
        if let newUser = User(moc: moc, entityName: "123") {
            newUser.name = "123"
            CoreDataManager.shared.saveContext()
        }
    }
    
    
    @IBAction func button4Action(_ sender: UIButton) {
        let moc1 = CoreDataManager.shared.viewContext
        let moc2 = CoreDataManager.shared.newBackgroundContext
        
        guard let newUser = User(moc: moc1, entityName: User.type),
            let  newItem = Item(moc: moc2) else {
            return
        }
        
        newItem.user = newUser
        
        CoreDataManager.shared.save(context: moc1)
        CoreDataManager.shared.save(context: moc2)
    }
    
    
}

