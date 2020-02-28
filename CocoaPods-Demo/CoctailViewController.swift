//
//  ViewController.swift
//  CocoaPods-Demo
//
//  Created by Alex Paul on 2/27/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import Kingfisher

class CoctailViewController: UIViewController {
  
  private let cocktailView = CocktailView()
  
  private lazy var swipeGesture: UISwipeGestureRecognizer = {
    let gesture = UISwipeGestureRecognizer()
    gesture.addTarget(self, action: #selector(fetchCocktail))
    gesture.direction = .left
    return gesture
  }()
  
  override func loadView() {
    view = cocktailView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    
    fetchCocktail()
    
    // setup swipe gesture on cocktailImage
    cocktailView.cocktailImage.isUserInteractionEnabled = true
    cocktailView.cocktailImage.addGestureRecognizer(swipeGesture)
  }
  
  // shake device to change cocktail
  // this is a UIResponser() method
  override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    if motion == .motionShake {
      fetchCocktail()
    }
  }
  
  @objc private func fetchCocktail() {
    APIClient.fetchCocktail { [weak self] (result) in
      switch result {
      case .failure(let error):
        print("oopos no cocktail for you \(error)")
      case .success(let cocktail):
        DispatchQueue.main.async {
          self?.updateUI(cocktail)
        }
      }
    }
  }
  
  private func updateUI(_ cocktail: Cocktail) {
    cocktailView.cocktailNameLabel.text = cocktail.strDrink
    cocktailView.indgredientsLabel.text = cocktail.ingredients
    guard let imageURL = URL(string: cocktail.strDrinkThumb) else {
      return
    }
    
    UIView.transition(with: cocktailView.cocktailImage, duration: 1.0, options: [.transitionFlipFromRight, .curveEaseInOut], animations: {
      self.cocktailView.cocktailImage.kf.setImage(with: imageURL)
    }, completion: nil)
  }


}

