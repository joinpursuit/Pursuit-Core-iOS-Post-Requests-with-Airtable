//
//  CreateClientViewController.swift
//  PostRequestsWithAirtable
//
//  Created by Cameron Rivera on 12/16/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class CreateClientViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    var charSet = CharacterSet(charactersIn: "\n")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        textField.placeholder = "Enter client name here"
    }
    
    @IBAction func createClientPressed(_ sender: UIBarButtonItem){
        sender.isEnabled = false
        guard let about = textField.text, !about.isEmpty, let name = textField.text, !name.isEmpty else {
            showAlert(title: "Missing Fields", message: "Name, or summary, or both are missing.")
            sender.isEnabled = true
            return
        }

        let newClient = ClientWrapper(fields: PostClient(name: name.trimmingCharacters(in: charSet), about: about.trimmingCharacters(in: charSet)))
        ClientAPI.manager.postClients(client: newClient) { [weak self] result in
            switch result{
            case .failure(let appError):
                DispatchQueue.main.async{
                    self?.showAlert(title: "Could not post client", message: "\(appError)")
                    sender.isEnabled = true
                }
            case .success:
                DispatchQueue.main.async{
                    self?.showAlert(title: "Success", message: "New client was successfully posted.") { alert in
                        self?.dismiss(animated: true)
                    }
                }
            }
        }
    }
}

extension CreateClientViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
