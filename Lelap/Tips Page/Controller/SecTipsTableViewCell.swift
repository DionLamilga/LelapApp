//
//  SecTipsTableViewCell.swift
//  Lelap
//
//  Created by Dion Lamilga on 05/05/21.
//

import UIKit

class SecTipsTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    
    static let identifier = "SecTipsTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "SecTipsTableViewCell", bundle: nil)
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
