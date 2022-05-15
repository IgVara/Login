//
//  ViewController.swift
//  Login
//
//  Created by Игорь Варакутин on 14.05.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let username = "Igor"
    private let password = "Password"

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let logInVC = segue.destination as? LogInViewController else { return }
        logInVC.user = username
    }


    @IBAction func loginPressed() {
        guard usernameTextField.text == username && passwordTextField.text == password
            else  {
            showAlert(title: "Invalid login or password", message: "Please, enter correct login and password",
            textField: passwordTextField
            )
                return
        }
        performSegue(withIdentifier: "loginVC", sender: nil)
    }
    
   
    @IBAction func showLogAndPassword(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Oops!", message: "Your name is \(username) 😉")
            : showAlert(title: "Oops!", message: "Your password is \(password) 😉")

    }
    @IBAction  func unwind(for unwindSegue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}


extension ViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle:.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
}
}
