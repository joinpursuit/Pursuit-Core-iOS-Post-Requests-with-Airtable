//
//  CreateClientViewController.swift
//  PostRequestsWithAirtable
//
//  Created by Michelle Cueva on 9/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

//import UIKit
//
//class CreateClientViewController: UIViewController {
//    // MARK: - IBOutlets
//    
//    @IBOutlet var nameTextField: UITextField!
//    @IBOutlet var aboutTextField: UITextField!
//    @IBOutlet var postButton: UIButton!
//    @IBOutlet var spinner: UIActivityIndicatorView!
//    
//    // MARK: - Lifecycle Methods
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        spinner.isHidden = true
//    }
//    
//    // MARK: - IBActions
//    
//    @IBAction func postNewClient(_ sender: UIButton) {//////
//        guard let client = createProjectFromFields() else {
//            displayInvalidProjectAlert()
//            return
//        }
//        startPostingAnimation()
//        ProjectAPIClient.manager.post(project) { [weak self] result in
//            switch result {
//            case .success:
//                self?.navigationController?.popViewController(animated: true)
//            case let .failure(error):
//                print(error)
//                self?.displayPostFailureAlert(with: error)
//                self?.stopPostingAnimation()
//            }
//        }
//    }
//    
//    // MARK: - Private Methods
//    
//    private func createClientFromFields() -> Client? {
//        guard let clientName = nameTextField.text else {
//            return nil
//        }
//        guard let about = aboutTextField.text else {
//            return nil
//        }
//        return Client(name: clientName, about: about, logo: nil)
//    }
//    
//    private func formattedAirtableDate(from date: Date) -> String {
//        return date.description.components(separatedBy: .whitespaces)[0]
//    }
//    
//    private func startPostingAnimation() {
//        postButton.isHidden = true
//        spinner.isHidden = false
//        spinner.startAnimating()
//    }
//    
//    private func stopPostingAnimation() {
//        postButton.isHidden = false
//        spinner.isHidden = true
//        spinner.stopAnimating()
//    }
//    
//    private func displayPostFailureAlert(with error: Error) {
//        displayAlert(title: "Error posting new Project", message: error.localizedDescription)
//    }
//    
//    private func displayInvalidProjectAlert() {
//        displayAlert(title: "Invalid Post", message: "Ensure you have completed fields")
//    }
//    
//    private func displayAlert(title: String, message: String) {
//        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        present(alertVC, animated: true, completion: nil)
//    }
//}
