//
//  Router.swift
//  JoseTutorial
//
//  Created by Samprithi Pushparaj on 19/11/20.
//

import UIKit

protocol RouterLogic {
  func route(to segue: UIStoryboardSegue)
}

class Router: NSObject, RouterLogic {
  
  func route(to segue: UIStoryboardSegue) {
    guard let identifier = segue.identifier else { return }
    
    let selector = Selector("routeTo" + identifier + "With:")
    
    guard responds(to: selector) else { return }
    perform(selector, with: segue)
  }
}

