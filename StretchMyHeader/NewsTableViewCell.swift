//
//  NewsTableViewCell.swift
//  StretchMyHeader
//
//  Created by Javier Xing on 2017-12-05.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    //Mark: Properties
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var headLineLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
