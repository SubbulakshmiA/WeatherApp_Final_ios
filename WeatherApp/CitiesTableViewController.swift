//
//  CitiesTableViewController.swift
//  WeatherApp
//
//  Created by user248645 on 10/12/23.
//

import Foundation

import UIKit


class CitiesTableViewController : UITableViewController ,UISearchBarDelegate
{
    
   @IBOutlet weak var mySearch: UISearchBar!
    
    
    @IBOutlet var myTableView: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       // mySearch.delegate = self
        
    }
    
    
    
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        // Called when the user begins editing the search bar
//    }

     
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        // Called when the text in the search bar changes
//        // You can use this to filter data or perform search operations
//    }
//
//
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        // Called when the user taps the search button
//        // You can initiate a search operation here
//    }

     

//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        // Called when the user taps the cancel button
//        // You can clear the search and dismiss the keyboard here
//    }
//
    
    
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
    
}


