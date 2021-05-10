//
//  NewViewController.swift
//  Lelap
//
//  Created by Dion Lamilga on 03/05/21.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!
    
    public var completion: ((String, String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()

        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        // Do any additional setup after loading the view.
    }

    @objc func didTapSave(){
        if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty{
            completion?(text, noteField.text)
        }
    }
}
