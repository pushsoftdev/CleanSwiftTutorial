//
//  ShowLoginInteractor.swift
//  JoseTutorial
//
//  Created by Samprithi Pushparaj on 19/11/20.
//

import Foundation

protocol ShowLoginBusinessLogic: class {
  
	func signIn(withUsername username: String, password: String)
}

protocol ShowLoginDataStore {
  
}

class ShowLoginInteractor: NSObject, ShowLoginDataStore {
  
  var presenter: ShowLoginPresentationLogic!
	
	private var validUserName = "abc@gmail.com"
	
	private var validPassword = "12345"
}

extension ShowLoginInteractor: ShowLoginBusinessLogic {
  
	func signIn(withUsername username: String, password: String) {
		
		if username == validUserName && password == validPassword {
			presenter.whenSignInSuccess()
		} else {
			presenter.whenSignInFailed()
		}
	}
}

