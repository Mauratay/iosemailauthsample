//
//  RegisterViewController.swift
//  FAITH
//
//  Created by Guylian Bollon on 08/01/2021.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onSubmit(_ sender: Any) {
        guard let email = self.emailTextField.text, let password = self.passwordTextField.text else {
              return
            }
              // [START headless_email_auth]
              Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
                guard let strongSelf = self else { return }
                // [START_EXCLUDE]
                  if let error = error {
                    let nerror = error as NSError
                    strongSelf.errorText.text = String(nerror.code)
                }
                else {
                    strongSelf.errorText.text = "Successfully logged in"
                }
              }
        }
}
