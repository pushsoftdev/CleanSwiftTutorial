//
//  ShowLoginPresenter.swift
//  JoseTutorial
//
//  Created by Samprithi Pushparaj on 19/11/20.
//

import Foundation

protocol ShowLoginPresentationLogic: class {
  
	func whenSignInSuccess()
	
	func whenSignInFailed()
}

class ShowLoginPresenter {
  weak var controller: ShowLoginDisplayLogic?
}

extension ShowLoginPresenter: ShowLoginPresentationLogic {
  
	func whenSignInFailed() {
		controller?.whenSignInFailed("Username / Password is incorrect!!")
	}
	
	func whenSignInSuccess() {
		controller?.whenSignInSuccess("Signed In successfully!")
	}
}
