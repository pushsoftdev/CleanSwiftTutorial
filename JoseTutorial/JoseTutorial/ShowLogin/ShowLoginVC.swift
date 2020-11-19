//
//  ShowLoginVC.swift
//  JoseTutorial
//
//  Created by Samprithi Pushparaj on 19/11/20.
//

import UIKit

protocol ShowLoginDisplayLogic: class {
  
	func whenSignInSuccess(_ message: String)
	
	func whenSignInFailed(_ message: String)
}

class ShowLoginVC: UIViewController {
  
  var router: (ShowLoginRoutingLogic & ShowLoginDataPassing)!
  var interactor: ShowLoginBusinessLogic!
	
	//MARK: - Outlets
	
	@IBOutlet weak var signInButton: UIButton!
	
	@IBOutlet weak var userNameTextField: UITextField!
	
	@IBOutlet weak var passwordTextField: UITextField!
  
	//MARK: - UIViewController Methods
	
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
	//MARK: - Private Methods
	
  private func setup() {
    let interactor = ShowLoginInteractor()
    let presenter = ShowLoginPresenter()
    let router = ShowLoginRouter()
    
    interactor.presenter = presenter
    presenter.controller = self
    
    router.controller = self
    router.dataStore = interactor
    
    self.router = router
    self.interactor = interactor
  }
	
	private func showAlert(withMessage message: String) {
		let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
		
		let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
		
		alert.addAction(okAction)
		
		present(alert, animated: true, completion: nil)
	}
	
	//MARK: - Handlers
	
	@IBAction func signInButtonHandler(_ button: UIButton) {
		
		let userName = userNameTextField.text ?? ""
		let password = passwordTextField.text ?? ""
		
		interactor.signIn(withUsername: userName, password: password)
	}
}

extension ShowLoginVC: ShowLoginDisplayLogic {
  
	func whenSignInFailed(_ message: String) {
		showAlert(withMessage: message)
	}
	
	func whenSignInSuccess(_ message: String) {
		showAlert(withMessage: message)
	}
}

//MARK: - UITextFieldDelegate

extension ShowLoginVC: UITextFieldDelegate {
	
}
