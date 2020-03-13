//
//  ViewController.swift
//  Weather Forecast
//
//  Created by Jonathan on 09/03/20.
//  Copyright © 2020 teste. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class ViewController: UITableViewController {
    
    var places = [Place]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadCity()
        
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
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=7c189bba4bca238455291a386f2294b5"
        Alamofire.request(url).responseJSON{ response in
            completion(response.result.value as! Data)
            //let name = "q?"
        }
    }

}

