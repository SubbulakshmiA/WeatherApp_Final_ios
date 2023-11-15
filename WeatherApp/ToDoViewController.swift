//
//  ToDoViewController.swift
//  WeatherApp
//
//  Created by user248645 on 10/12/23.
//

import Foundation

import UIKit


class ToDoViewController : UIViewController, UISearchBarDelegate
{
    
    @IBOutlet weak var saveCity: UIBarButtonItem!
    @IBOutlet weak var mySearch: UISearchBar!
    
    let citiesURL = "http://gd.geobytes.com/AutoCompleteCity?q=Tor&callback=?"
    
 //   lazy var cityNames : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Service.shared.getDataFrom(urlStr: citiesURL)
//        {
//            result   in
//            switch result {
//            case .failure(let err): print("eror: \(err)")
//            case .success( let xdata) :
//                print(xdata)
//                // converting data to JSON String
//                if let jsonString = String(data : xdata , encoding: .utf8){
//                    print("jsonString \(jsonString)")
//                    // cleaning JSON String
//
//                    let cleanedJsonString = jsonString.replacingOccurrences(of: "?", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: ";", with: "")
//
//                    if let cleanedData = cleanedJsonString.data(using: .utf8){
//                        print("cleanedData \(cleanedData)")
//                        // decoding and parsing to City object
//                        let resultSet = try? JSONDecoder().decode([String].self, from: cleanedData )
//
//                        if let results = resultSet {
//                            DispatchQueue.main.async {
//                                for item in results{
//                                    let city : String = item
//                                    print("city \(city)")
//                                    let cityNames : [String] = item.components(separatedBy: ",")
//                                    print("cityName \(cityNames[0])")
//
//                                }
//                            }
//                        }
//
//
//                    }
//                }
//                
//                
//            }
//        }
    }
    
    func searchBar(
        _ searchBar: UISearchBar,
        textDidChange searchText: String
    ){
        if searchText.count >= 3 {
            
                let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with the name of your storyboard
            if let populateTvController = storyboard.instantiateViewController(withIdentifier: "populateTv") as? PopulateTableViewController {
                // Configure the next view controller, if needed
                populateTvController.searchTextValue = searchText
                
                // Present or push the next view controller
                // If you're using a navigation controller, push it onto the stack
                self.navigationController?.pushViewController(populateTvController, animated: true)
                // If you're not using a navigation controller, present it modally
                // self.present(nextViewController, animated: true, completion: nil)
            }
        }
        
         
    }
    
//    override func performSegue(withIdentifier identifier: String, sender: Any?) {
//        <#code#>
//    }
    
    
    
    
    
    
}
