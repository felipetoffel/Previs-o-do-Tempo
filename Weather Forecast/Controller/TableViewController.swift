//
//  TableViewController.swift
//  Weather Forecast
//
//  Created by Jonathan on 10/03/20.
//  Copyright © 2020 teste. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class TableViewController: UITableViewController {
    
    var places: [Place] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCity()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //as? cell
        let cellIdentifier = "cityPlace"
        
        guard let cells = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? cell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
            }
        let place = places[indexPath.row]
            
        cells.namePlace.text = place.name
        cells.descriptionPlace.text = place.description
        cells.celsius.text = place.temperature
        
        // Configure the cell...

        return cells
    }
    

    func loadCity(){
        listCity(city: "São Paulo") {
            (response : Data) in
            let object = try? JSON(data:response)
            let nomePlace = (object!["name"] as AnyObject? as? String) ?? ""
            let descrip = (object!["weather"]["description"] as AnyObject? as? String) ?? ""
            let icon = (object!["weather"]["icon"] as AnyObject? as? String) ?? ""
            let temperatura = (object!["main"]["temp"] as AnyObject? as? String) ?? ""
            print("como assim?")
            let place1 = Place(name: nomePlace, placeDescription: descrip, icon: icon, temperature: temperatura)
            self.places += [place1]
            
        }
        
        listCity(city: "Blumenau") {
            (response : Data) in
            let object = try? JSON(data:response)
            let nomePlace = (object!["name"] as AnyObject? as? String) ?? ""
            let descrip = (object!["weather"]["description"] as AnyObject? as? String) ?? ""
            let icon = (object!["weather"]["icon"] as AnyObject? as? String) ?? ""
            let temperatura = (object!["main"]["temp"] as AnyObject? as? String) ?? ""
            print("como assim?")
            let place2 = Place(name: nomePlace, placeDescription: descrip, icon: icon, temperature: temperatura)
            self.places += [place2]
        }
        
        
        listCity(city: "Florianopolis") {
            (response : Data) in
            let object = try? JSON(data:response)
            let nomePlace = (object!["name"] as AnyObject? as? String) ?? ""
            let descrip = (object!["weather"]["description"] as AnyObject? as? String) ?? ""
            let icon = (object!["weather"]["icon"] as AnyObject? as? String) ?? ""
            let temperatura = (object!["main"]["temp"] as AnyObject? as? String) ?? ""
            print("como assim?")
            let place3 = Place(name: nomePlace, placeDescription: descrip, icon: icon, temperature: temperatura)
            self.places += [place3]
            
        }
        
        
    }
    
    func listCity (city: String, completion: @escaping (_ response: Data) -> Void){
        let cidade = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let url = "http://api.openweathermap.org/data/2.5/weather?q=\(cidade!)&appid=7c189bba4bca238455291a386f2294b5"
        Alamofire.request(url).responseJSON{ response in
            completion(response.result as! Data)
            //let name = "q?"
        }
    }

}
