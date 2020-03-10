//
//  cell.swift
//  Weather Forecast
//
//  Created by Jonathan on 09/03/20.
//  Copyright © 2020 teste. All rights reserved.
//

import UIKit

class cell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var namePlace: UILabel!
    @IBOutlet weak var celsius: UILabel!
    @IBOutlet weak var descriptionPlace: UILabel!
    
    func setSeletected(_selected: Bool, animated: Bool) {
        super.setSelected(_selected, animated: animated)
    }
    
}
