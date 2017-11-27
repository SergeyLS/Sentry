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
    
    let zeroSegue = "ziro"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Понимаю, что проект тестовый, но названия методам лучше всегда привыкать давать содержательные
    @IBAction func button1Action(_ sender: UIButton) {
        // MARK: Везде, где можно рекомендую использовать self., чтобы не путать при чтении кода с локально обьявленными переменными и методами. Это уже скорее как привычка должна быть.
        // MARK: Аналогично - строковый литерал затесался здесь, для сегвеев можно просто в рамках данного класса прописывать
        self.performSegue(withIdentifier: self.zeroSegue, sender: nil)
    }
    
    @IBAction func button2Action(_ sender: UIButton) {
        Client.shared?.crash()
    }
    
    @IBAction func button3Action(_ sender: UIButton) {
        // MARK: Самый главный момент - взаимодействия напрямую с конкретным Storage не должно быть в контроллере. Нужно либо выносить в сервис, либо создавать фабрику, либо выносить в ViewModel. Должно быть что-то в духе someService.addUser(name: "123"). Аналогично в методе ниже
        let moc = CoreDataManager.shared.viewContext
        if let newUser = User(entityName: "123", moc: moc) {
            newUser.name = "123"
            CoreDataManager.shared.saveContext()
        }
    }
    
    @IBAction func button4Action(_ sender: UIButton) {
        let moc1 = CoreDataManager.shared.viewContext
        let moc2 = CoreDataManager.shared.newBackgroundContext
        
        guard let newUser = User(entityName: User.type, moc: moc1),
            let  newItem = Item(moc: moc2) else {
            return
        }
        
        newItem.user = newUser
        
        CoreDataManager.shared.save(context: moc1)
        CoreDataManager.shared.save(context: moc2)
    }
    
    @IBAction func button5Action(_ sender: UIButton) {
        let user = UserServiceFactory.shared.createUserService(name: "Sergey")
        print(user?.firstName ?? "?")
    }
    
}
