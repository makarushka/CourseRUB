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
    private var moneyCount: Double = 0.0
    private var convertIndex: Double = 1 {
        willSet {
            countMoney.text = "\(round(1000 * (newValue) * moneyCount) / 1000) руб за \(Int(newValue)) шт"
        }
    }
    
    
    @IBOutlet private weak var codeMoney: UILabel!
    @IBOutlet private weak var titleMoney: UILabel!
    @IBOutlet private weak var countMoney: UILabel!
    
    func configureCell() {
        if let model = modelFromCell {
            let valueCount = model.value / Double(model.nominal)
            self.moneyCount = round(1000*valueCount)/1000
            codeMoney.text = model.charCode
            titleMoney.text = model.name
            countMoney.text = "\(self.moneyCount) руб. за 1 шт"
        }
    }
    
    
    @IBAction func convertMoneyAction(_ sender: UIStepper) {
        self.convertIndex = sender.value
    }
    
    
    
}




