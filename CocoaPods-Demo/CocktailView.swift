//
//  CocktailView.swift
//  CocoaPods-Demo
//
//  Created by Alex Paul on 2/27/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import SnapKit

class CocktailView: UIView {
  
  // cocktail name label
  public lazy var cocktailNameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
    label.numberOfLines = 2
    label.text = "Cocktail Name"
    label.textAlignment = .center
    return label
  }()
  
  // cocktail image
  public lazy var cocktailImage: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFit
    iv.image = UIImage(systemName: "photo")
    return iv
  }()
  
  public lazy var indgredientsLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.preferredFont(forTextStyle: .title1)
    label.numberOfLines = 0
    label.text = "Ingredients"
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    setupCocktailImageConstraints()
    setupCocktailNameLabel()
    setupIngredientsLabel()
  }
  
  private func setupCocktailImageConstraints() {
    addSubview(cocktailImage)
    cocktailImage.snp.makeConstraints { (make) in
      make.top.leading.bottom.trailing.equalTo(self.safeAreaLayoutGuide)
    }
  }
  
  private func setupCocktailNameLabel() {
    cocktailImage.addSubview(cocktailNameLabel)
    cocktailNameLabel.snp.makeConstraints { (make) in
      make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
    }
  }
  
  private func setupIngredientsLabel() {
    cocktailImage.addSubview(indgredientsLabel)
    indgredientsLabel.snp.makeConstraints { (make) in
      make.leading.bottom.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
    }
  }
}
