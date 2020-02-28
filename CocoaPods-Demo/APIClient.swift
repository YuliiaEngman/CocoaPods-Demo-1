//
//  APIClient.swift
//  CocoaPods-Demo
//
//  Created by Alex Paul on 2/27/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation
import Alamofire // import NetworkHelper

struct APIClient {
  
  // Result<Cocktail, Error>
  static func fetchCocktail(completion: @escaping (Result<Cocktail>) -> ()) {
    let endpointURLString = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
    
    // we need a URL
    guard let url = URL(string: endpointURLString) else {
      return
    }
    
    Alamofire.request(url).response { (response) in
      //response.data
      //response.error
      //response.request
      if let error = response.error {
        completion(.failure(error))
      } else if let data = response.data {
        // stir our Cocktail
        do {
          let results = try JSONDecoder().decode(DrinksWrapper.self, from: data)
          if let cocktail = results.drinks.first {
            completion(.success(cocktail))
          }
        } catch {
          completion(.failure(error))
        }
      }
    }
  }
  
}

