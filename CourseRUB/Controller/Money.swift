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
    
    @IBOutlet private weak var titleMoney: UILabel!
    @IBOutlet private weak var countMoney: UILabel!
    
    func configureCell() {
        if let model = modelFromCell {
            titleMoney.text = model.name
            countMoney.text = String(model.value)
        }
    }
    
}
