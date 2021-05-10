//
//  TipsViewController.swift
//  Lelap
//
//  Created by Dion Lamilga on 04/05/21.
//

import UIKit

class TipsInfo{
    var title: String?
    var content: [String]?
    
    init(title: String, content: [String]){
        self.title = title
        self.content = content
    }
}

class TipsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableTips: UITableView!
    
    var tipsInfo = [TipsInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableTips.delegate = self
        tableTips.dataSource = self
        
        tableTips.tag = 1
        
        tableTips.register(FirstTipsTableViewCell.nib(), forCellReuseIdentifier: FirstTipsTableViewCell.identifier)
        
        tableTips.register(SecTipsTableViewCell.nib(), forCellReuseIdentifier: SecTipsTableViewCell.identifier)
        
        tableTips.register(ThirdTipsTableViewCell.nib(), forCellReuseIdentifier: ThirdTipsTableViewCell.identifier)
        
        tableTips.allowsSelection = true
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView.tag {
        case 1:
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: FirstTipsTableViewCell.identifier, for: indexPath) as! FirstTipsTableViewCell
                return cell
            }
            
            if indexPath.row == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: SecTipsTableViewCell.identifier, for: indexPath) as! SecTipsTableViewCell
                return cell
            }
            
            if indexPath.row == 2{
                let cell = tableView.dequeueReusableCell(withIdentifier: ThirdTipsTableViewCell.identifier, for: indexPath) as! ThirdTipsTableViewCell
                return cell
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 426
        }
        else if indexPath.row == 1{
            return 540
        }
        else{
            return 640
        }
    }
}
