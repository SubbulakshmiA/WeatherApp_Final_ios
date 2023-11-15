//
//  PopulateTableViewController.swift
//  WeatherApp
//
//  Created by user248645 on 10/12/23.
//

import Foundation

import UIKit


class  PopulateTableViewController : UITableViewController, UISearchBarDelegate
{
    
    
    var searchTextValue :String = ""
    
    let resultSet = 0
    
    let searchBar = UISearchBar()
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
    //    mySearch.text = searchText
        searchBar.delegate = self
        
        searchBar.text = searchTextValue
        searchBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 44)
        self.view.addSubview(searchBar)
        callingApi()
    }

    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            // Called when the user begins editing the search bar
        }

         
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Called when the text in the search bar changes
        // You can use this to filter data or perform search operations
        //            searchBar.text = searchTextValue
        if searchText.count >= 3 {
            
            print("\(searchText)")
            searchTextValue = searchText
            callingApi()
        }
    }

    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        
        cell.textLabel?.text = "cities"
        
        
        return cell
        
    }

    
    func callingApi(){
        
        let citiesURL = "http://gd.geobytes.com/AutoCompleteCity?q=\(self.searchTextValue)&callback=?"
        Service.shared.getDataFrom(urlStr: citiesURL)
        {
            result   in
            switch result {
            case .failure(let err): print("eror: \(err)")
            case .success( let xdata) :
                print(xdata)
                // converting data to JSON String
                if let jsonString = String(data : xdata , encoding: .utf8){
                    print("jsonString \(jsonString)")
                    // cleaning JSON String

                    let cleanedJsonString = jsonString.replacingOccurrences(of: "?", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: ";", with: "")

                    if let cleanedData = cleanedJsonString.data(using: .utf8){
                        print("cleanedData \(cleanedData)")
                        // decoding and parsing to City object
                        let resultSet = try? JSONDecoder().decode([String].self, from: cleanedData )

                        if let results = resultSet {
                            DispatchQueue.main.async {
                                for item in results{
                                    let city : String = item
                                    print("city \(city)")
                                    let cityNames : [String] = item.components(separatedBy: ",")
                                    print("cityName \(cityNames[0])")

                                }
                            }
                        }


                    }
                }
                
                
            }
        }

    }
    
    
    
    
}
