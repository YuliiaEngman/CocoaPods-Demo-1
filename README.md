# CocoaPods - A dependency manager 

Other dependency managers used by Swift developers are Swift package manager and Carthage. CocoaPods is by far the most popular, with Swift package manager's integration into Xcode as of iOS 13 it is greatly being embraced and used by the community of iOS developers. 

Working with CocoaPods dependency manager. In this app we used [Alamofire](https://github.com/Alamofire/Alamofire), [SnapKit](https://github.com/SnapKit/SnapKit) and [Kingfisher](https://github.com/onevcat/Kingfisher).

![app screenshot](Assets/app-screenshot.png)

## 1. Install CocoaPods 

[CocoaPods](https://guides.cocoapods.org/using/getting-started.html)

Terminal command:   

```sudo gem install cocoapods```

## 2. Initialize CocoaPods in your Xcode project 

Terminal command:   

```pod init```

At this point you will now have a ```Podfile```

```ruby 
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'CocoaPods-Advance' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CocoaPods-Advance

  target 'CocoaPods-AdvanceTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
```

## 3. Edit Podfile with dependencies needed and Install

```ruby 
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'CocoaPods-Advance' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CocoaPods-Advance
  pod 'Alamofire', '~> 4.9.1'
  pod 'SnapKit', '~> 5.0.1'
  pod 'Kingfisher', '~> 5.12.0'

  target 'CocoaPods-AdvanceTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
```

Terminal command:   

```pod install```

```
Analyzing dependencies
Downloading dependencies
Installing Alamofire (4.9.1)
Installing Kingfisher (5.12.0)
Installing SnapKit (5.0.1)
Generating Pods project
Integrating client project
Pod installation complete! There are 3 dependencies from the Podfile and 3 total pods installed.
```

Xcode now has 2 projects, your original Project and now a Pods project. An xcworkspace will be now handling both projects from now on. This xcworkspace is where you will be editing your project from now.


## 4. Deintegrate Cocoapods from an Xcode project 

Terminal command:    

```pod deintegrate```

## 5. Using Alamofire via Cocoapods install 

Add the following to the Podfile:    

```pod 'Alamofire'```

```swift 
import Alamofire

public static func fetchCocktail(completion: @escaping (Result<Cocktail>) -> ()) {
  let endpointURLString = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
  guard let url = URL(string: endpointURLString) else { return }
  Alamofire.request(url).response { (response) in
    if let error = response.error {
      completion(.failure(error))
    } else if let data = response.data  {
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
```

## 6. Using SnapKit via CocoaPods install

Add the following to the Podfile:    

```pod 'SnapKit'```

```swift 
import SnapKit 

addSubview(cocktailImage)
cocktailImage.snp.makeConstraints { (make) in
  make.top.leading.bottom.trailing.equalTo(self)
}
```

## 7. Using Kingfisher via CocoaPods install 

Add the following to the Podfile:    


```pod 'Kingfisher'```

```swift 

import Kingfisher 

self?.cocktailView.cocktailImage.kf.setImage(with: URL(string: cocktail.strDrinkThumb))
```

## Resources 

[Github trending repositories for Swift](https://github.com/trending/swift)
