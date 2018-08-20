//
//  CustomiseViewController.swift
//  EurekaDemo
//
//  Created by asmita.borawake on 20/08/18.
//  Copyright © 2018 asmita.borawake. All rights reserved.
//

import UIKit
import Eureka
class CustomiseViewController: FormViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
          createLoginForm()
        
    }
    
    func createLoginForm(){
        form +++ Section()
            
            //defined rowtype using form creation
            <<< TextRow("enailRow") {
                $0.placeholder = "Please enter your email"
                $0.title = "Email"
                $0.add(rule: RuleRequired(msg: "Email is required", id: "enailRow"))
                $0.add(rule: RuleEmail(msg: "email format wrong", id: "enailRow"))
                $0.validationOptions = .validatesOnChangeAfterBlurred
                
                }.cellUpdate({ (cell, row) in
                    if !row.isValid{
                        cell.textLabel?.textColor = .red
                    }
                })
                
                .onRowValidationChanged({ (cell, row) in
                    let rowIndex = row.indexPath!.row
                    while row.section!.count > rowIndex + 1 && row.section?[rowIndex + 1] is LabelRow {
                        row.section?.remove(at: rowIndex + 1)
                    }
                    if !row.isValid {
                        for (index, validateMsg) in row.validationErrors.map({ $0.msg }).enumerated(){
                            
                            let labelRow  = LabelRow(){
                                $0.title = validateMsg
                                $0.cell.height = { 30 }
                                
                            }
                            row.section?.insert(labelRow , at: row.indexPath!.row + index + 1)
                        }
                        
                        
                    }
                    
                })
            <<< PasswordRow("passwordRow") {
                $0.placeholder = "Please enter your password"
                $0.title = "Password"
                $0.add(rule: RuleRequired(msg: "Password is require", id: "passwordRow"))
                $0.validationOptions = .validatesOnChangeAfterBlurred
                }.cellUpdate({ (cell, row) in
                    if !row.isValid{
                        cell.textLabel?.textColor = .red
                    }
                })
                .onRowValidationChanged({ (cell, row) in
                    let rowIndex = row.indexPath!.row
                    while row.section!.count > rowIndex + 1 && row.section?[rowIndex + 1] is LabelRow {
                        row.section?.remove(at: rowIndex + 1)
                    }
                    if !row.isValid {
                        for (index, validateMsg) in row.validationErrors.map({ $0.msg }).enumerated(){
                            
                            let labelRow  = LabelRow(){
                            $0.title = validateMsg
                            $0.cell.height = { 30 }
                            
                        }
                        row.section?.insert(labelRow , at: row.indexPath!.row + index + 1)
                    }
                    
                    
                  }
                    
                })

        
    }

   
    @IBAction func login_Click(_ sender: Any) {
        self.view.endEditing(true)
        let errors = form.validate()
        print(errors)
        print(self.form.values())
         let allFormData = self.form.values()
         //Direct access to value
        if let email = allFormData["enailRow"] as? String
        {
            print(email) //should print only "Comments"
        }
        if let password = allFormData["passwordRow"] as? String
        {
            print(password) //should print only "Comments"
        }
        
       

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    

    

}
