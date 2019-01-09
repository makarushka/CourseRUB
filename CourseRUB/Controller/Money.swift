//
//  Money.swift
//  CourseRUB
//
//  Created by Yuriy on 09/01/2019.
//  Copyright © 2019 Yuriy. All rights reserved.
//

import UIKit

class Money: UICollectionViewCell {
    
    var modelFromCell: Valute?
    
    @IBOutlet private weak var codeMoney: UILabel!
    @IBOutlet private weak var titleMoney: UILabel!
    @IBOutlet private weak var countMoney: UILabel!
    
    func configureCell() {
        if let model = modelFromCell {
            let valueCount = model.value / Double(model.nominal)
            
            codeMoney.text = model.charCode
            titleMoney.text = model.name
            countMoney.text = String(round(1000*valueCount)/1000)
        }
    }
    
}




