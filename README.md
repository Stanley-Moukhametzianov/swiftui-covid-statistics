
# swiftui-covid-statistics

* App using Swift 5, to view data from the official [News API](https://newsapi.org) and 
[COVID-19 data](https://corona.lmao.ninja).
* Uses a grid to display the latest Covid Data including the affected, deaths, recovered, active and serious. Likewise, the
app also uses a bargraph to display the changes in cases across the week. Lastly, at the bottom of the app there 
is a tab that presents the latest articles 
* **Note:** to open web links in a new window use: _ctrl+click on link_

## :page_facing_up: Table of contents

* [swiftui-covid-statistics](#swiftui-covid-statistics)
  * [:page_facing_up: Table of contents](#page_facing_up-table-of-contents)
  * [:books: General info](#books-general-info)
  * [:camera: Screenshots](#camera-screenshots)
  * [:floppy_disk: App Setup](#floppy_disk-app-setup)
  * [:computer: Code Examples](#computer-code-examples)
  * [:cool: Features](#cool-features)
  * [:file_folder: License](#file_folder-license)
  * [:envelope: Contact](#envelope-contact)

## :books: General info

* Covid Data gets data from the [disease.sh](https://corona.lmao.ninja).
* The app also has a sheet that is able to present the user with the latest covid news articles. For this to work
the user needs to install the github repostory [Better Safari View](https://github.com/stleamist/BetterSafariView)
* The information is displayed using a grid and a bar graph. 
* This mobile app was created following the MVVM framework. The Model is responsible 
for making calls to the API and fetching the json data. 


## :camera: Screenshots
<img align="left" width="300" height="600" src="https://github.com/Stanley-Moukhametzianov/swiftui-covid-statistics/blob/MatchingGame/ezgif.com-gif-maker-2.gif">

<p float="left">
  <img src="https://user-images.githubusercontent.com/66892566/127056983-ec059f4e-5c93-43d3-b47f-2a81b0644781.PNG" width="300" />
  <img src="https://user-images.githubusercontent.com/66892566/127056991-10b73ca5-2ee7-4e25-b269-fe91fab79384.PNG" width="300" />
  <img src="https://user-images.githubusercontent.com/66892566/127056965-509bd610-c45e-4ee3-ac73-0a3114cee023.PNG" width="300" />
  <img src="https://user-images.githubusercontent.com/66892566/127056977-41a8798a-e0c3-4b67-b05c-92f4c63cbf51.PNG" width="300" /> 
  <img src="https://user-images.githubusercontent.com/66892566/127056972-d1539ebe-2d1c-4fee-a604-bc1442ade2db.PNG" width="300" /> 
</p>

## :floppy_disk: App Setup

* Get yourself a [News API key](https://newsapi.org). As long as this project is not for 
a business or for comerical use this should be free. The disease.sh request URL does not 
requre an api key, so this is already included in the project.
* Once you copy the Xcode peoject you will still need to create an additional swift file. 
The file should be called NewsAPI.swift and should be placed in the NewsData folder. The file should 
also have the code: 

```swift

import Foundation

struct NewsAPI{
    static let key = "3480ab030593764efba20efc0ff19d15a"
}

```
* Make sure to replace the fake api key with your own and do not include any spaces. 

## :computer: Code Examples

* ` NetworkManager.swift` creates a fetch request and return JSON data from News API.

```swift

import Foundation

import Foundation

final class NetworkManager<T: Codable>{
    func fetch(from url: URL, completion: @escaping (Result<T,NetworkError>) -> Void ){
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else{
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                completion(.failure(.invalidResponse(response: response!.description)))
                return
            }
            guard let data = data else{
                completion(.failure(.invalidData))
                return
            }
            do{
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            }catch let err{
                completion(.failure(.decodingError(err: err.localizedDescription)))
                print(err)
            }
        }.resume()
    }
}
enum NetworkError: Error{
    case error(err: String)
    case invalidResponse(response: String)
    case invalidData
    case decodingError(err: String)
}

```

## :cool: Features
* The app also allows you to view the global corona cases as well as filter by country. If you clone the project
you will see a Countries.swift file that contains all of the countries you can search for. If an invalid
country is entered you will get an error message. Likewise, with the news sheet you can select articles 
you want and read them on your phone without leaving the app. 


## :file_folder: License

* This project is licensed under the terms of the MIT license.

## :envelope: Contact

* Repo created by [Stanley Moukhametzianov](https://github.com/Stanley-Moukhametzianov?tab=repositories), email: stanleymoukh@gmail.com
