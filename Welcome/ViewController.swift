//
//  ViewController.swift
//  Welcome
//
//  Created by Diamond on 02/03/2024.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeName: UILabel!
    @IBOutlet weak var welcomeBtn: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var enterNameLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        enterNameLbl.text = NSLocalizedString("Enter Name", comment: "")
        welcomeBtn.setTitle(NSLocalizedString("Welcome", comment: ""), for: .normal)
        welcomeBtn.isEnabled = true
        textField.delegate = self
    }

    @IBAction func welcomeBtn(_ sender: Any) {
        if let name = textField.text, !name.isEmpty {
            if letters(text: name) {
                welcomeName.text = NSLocalizedString("Welcome ", comment: "") + name
            } else {
                showAlert(message: NSLocalizedString("Please enter a valid name without numbers", comment: ""))
            }
        } else {
            showAlert(message: NSLocalizedString("Please enter a name", comment: ""))
        }
    }

}

extension ViewController: UITextFieldDelegate {

    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func letters(text: String) -> Bool {
        let letters = CharacterSet.letters
        return text.rangeOfCharacter(from: letters.inverted) == nil
    }
}
