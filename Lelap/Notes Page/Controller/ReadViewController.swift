//
//  ReadViewController.swift
//  Lelap
//
//  Created by Dion Lamilga on 03/05/21.
//

import UIKit

class ReadViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!
    
    public var noteTitle: String = ""
    public var note: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = noteTitle
        noteLabel.text = note
        // Do any additional setup after loading the view.
    }
    
}
