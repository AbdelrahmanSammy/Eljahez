//
//  LoginViewController.swift
//  Eljahz
//
//  Created by Abdelrhman on 10/17/20.
//  Copyright © 2020 com.Eljahz.Eljahz. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginTitleLabel: UILabel!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var doNotHaveAccountButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var visitorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mailTextField.setleftIcon(UIImage(named: "mailIcon")!)
        phoneTextField.setleftIcon(UIImage(named: "phoneIcon")!)
        passwordTextField.setleftIcon(UIImage(named: "passwordIcon")!)
        addTextFieldBorder(texField: mailTextField)
        addTextFieldBorder(texField: phoneTextField)
        addTextFieldBorder(texField: passwordTextField)

        
        
        
        
        loginButton.layer.cornerRadius = 24
        // Do any additional setup after loading the view.
    }
    
    func addTextFieldBorder(texField:UITextField){
        texField.layer.cornerRadius = 24
        texField.layer.borderWidth = 2
        texField.layer.borderColor = UIColor.orange.cgColor
    }
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        login ()
    }
    @IBAction func forgetPasswordAction(_ sender: Any) {
    }
    
    @IBAction func registrationButtonAction(_ sender: Any) {
    }
    @IBAction func visitorButtonAction(_ sender: Any) {
    }
    func login () {
         
         let paramter = ["remember_me":"true","email":mailTextField.text!,"password":passwordTextField.text!] as [String:AnyObject]
         Utilities.showLoader(view: self.view)
         LoginManager.Manager.Loginm(LoginParameter: paramter){
             (data) in
         Utilities.hideLoader(view: self.view)
             let result = data as? String
             
             if result == "Done" {
                 print(" Login Done")
                 User.setisFirstTime(isFirstTime: true)
                 User.setSignout(Signout: false)
              let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
              let HomeViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController")
             self.present(HomeViewController, animated: true, completion: nil)
                 
             }
             else
             {
                 let Result = data as? String
                 Utilities.showAlertViewWithTitle(title: Result ?? "Missing Data", msg: "", cancelBtnTitle: "OK")
             }

         }
         
     }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
