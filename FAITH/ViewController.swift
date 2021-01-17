//
//  ViewController.swift
//  FAITH
//
//  Created by Guylian Bollon on 07/01/2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onSubmit(_ sender: Any) {
        guard let email = self.usernameTextfield.text, let password = self.passwordTextField.text else {
              return
            }
              // [START headless_email_auth]
              Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let strongSelf = self else { return }
                // [START_EXCLUDE]
                  if let error = error {
                    strongSelf.errorText.text = error.localizedDescription
                } else{
                    strongSelf.navigationController?.popViewController(animated: true)
                }
              }
    }
}

