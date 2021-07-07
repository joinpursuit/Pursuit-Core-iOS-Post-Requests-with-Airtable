//
//  CreateClientViewController.swift
//  PostRequestsWithAirtable
//
//  Created by Sam Roman on 9/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class CreateClientViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var aboutTextField: UITextField!
    
    @IBOutlet weak var postOutlet: UIButton!
    
    
    @IBAction func postAction(_ sender: UIButton) {
        postOutlet.isEnabled = false
        guard let client = createClientFromFields() else {
            displayInvalidClientAlert()
            return
        }
        ClientsAPIClient.manager.post(client) { [weak self] result in
            switch result {
            case .success:
                self?.navigationController?.popViewController(animated: true)
            case let .failure(error):
                print(error)
                self?.displayPostFailureAlert(with: error)
            }
        }
        
    }

    private func displayAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    private func displayPostFailureAlert(with error: Error) {
        displayAlert(title: "Error posting new Client", message: error.localizedDescription)
    }
    
    private func displayInvalidClientAlert() {
        displayAlert(title: "Invalid Post", message: "Ensure you have completed fields")
    }
    
    
    private func createClientFromFields () -> Clients? {
        guard let name = nameTextField.text else {
            return nil
        }
        guard let about = aboutTextField.text else {
            return nil }
        let fields = Fields(about: about, name: name, logo: nil)
        return Clients(fields: fields)
        
    }
    
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

}
