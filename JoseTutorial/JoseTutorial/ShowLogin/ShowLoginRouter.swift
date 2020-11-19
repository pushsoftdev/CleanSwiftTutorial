//
//  ShowLoginRouter.swift
//  JoseTutorial
//
//  Created by Samprithi Pushparaj on 19/11/20.
//

import Foundation

protocol ShowLoginRoutingLogic {
  
}

protocol ShowLoginDataPassing {
  var dataStore: ShowLoginDataStore? { get }
}

class ShowLoginRouter: Router, ShowLoginRoutingLogic, ShowLoginDataPassing {
  
  weak var controller: ShowLoginVC?
  var dataStore: ShowLoginDataStore?
  
  
}

