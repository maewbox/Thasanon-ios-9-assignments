//
//  MainTableView.swift
//  BnBVestor
//
//  Created by Thasanon, Namfon on 9/10/16.
//  Copyright © 2016 maewbox. All rights reserved.
//

import Foundation
import UIKit


class MainTableViewCell: UITableViewCell {
    

    
    @IBOutlet weak var rankImg: UIImageView!
    
    @IBOutlet weak var dollarAmount: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var avgNightlyLabel: UILabel!
    @IBOutlet weak var numberOfListingLabel: UILabel!
    @IBOutlet weak var hotelAvgLabel: UILabel!
    @IBOutlet weak var profitEstLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    

    
  
}

