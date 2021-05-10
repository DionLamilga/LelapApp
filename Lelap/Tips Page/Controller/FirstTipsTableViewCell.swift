//
//  FirstTipsTableViewCell.swift
//  Lelap
//
//  Created by Dion Lamilga on 04/05/21.
//

import UIKit

class FirstTipsTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    
    static let identifier = "FirstTipsTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "FirstTipsTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
