//
//  Datas.swift
//  Lelap
//
//  Created by Dion Lamilga on 05/05/21.
//

import Foundation

class Datas: NSObject, Codable {
    var title: String
    var content: String
    
    init(title: String, content: String){
        self.title = title
        self.content = content
    }
}
