//
//  Acount.swift
//  SampleTableView
//
//  Created by 松田陽尚 on 2021/04/21.
//

import Foundation

struct Acount {
    var name = String()
    var money = Int()
    var kakemoney = 0
    mutating func change(kake: Int){
        
        self.kakemoney = kake
        
    }
}
