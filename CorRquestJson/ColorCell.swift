//
//  ColorCell.swift
//  CorRquestJson
//
//  Created by Ronilson on 22/03/17.
//  Copyright © 2017 Ronilson. All rights reserved.
//

import UIKit

class ColorCell: UITableViewCell {
    
    @IBOutlet var colorName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(title: String){
        self.colorName.text = title
    }
}
