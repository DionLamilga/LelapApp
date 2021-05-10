//
//  ThirdTipsTableViewCell.swift
//  Lelap
//
//  Created by Dion Lamilga on 05/05/21.
//

import UIKit

class ThirdTipsTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    
    static let identifier = "ThirdTipsTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "ThirdTipsTableViewCell", bundle: nil)
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
