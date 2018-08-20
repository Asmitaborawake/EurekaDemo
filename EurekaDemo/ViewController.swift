//
//  ViewController.swift
//  EurekaDemo
//
//  Created by asmita.borawake on 20/08/18.
//  Copyright © 2018 asmita.borawake. All rights reserved.
//

import UIKit
import Eureka

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLoginForm()
    }

    
    func createLoginForm(){
       form +++ Section()
        
        //defined rowtype using form creation
        <<< TextRow("enailRow") {
            $0.placeholder = "type your email"
            $0.title = "Email"
        }
        <<< PasswordRow("passwordRow") {
            $0.placeholder = "type your password"
            $0.title = "Password"
        }
        <<< ButtonRow() { // for creating button to form
            $0.title = "Login"
            }.onCellSelection({ (cell, row) in  //for getting value of each row
                print(self.form.values())
            })
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

