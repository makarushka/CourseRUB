//
//  CourseVC.swift
//  CourseRUB
//
//  Created by Yuriy on 09/01/2019.
//  Copyright © 2019 Yuriy. All rights reserved.
//

import UIKit

class CourseVC: UIViewController{

    @IBOutlet private weak var collectionMoney: UICollectionView!
    @IBOutlet weak var codeMoney: UILabel!
    @IBOutlet private weak var downloadIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionMoney.delegate = self
        self.collectionMoney.dataSource = self
        
        Processing.instance.downloadAllData {
            DispatchQueue.main.async {
                self.collectionMoney.reloadData()
                self.downloadIndicator.stopAnimating()
            }
        }
    }
}





extension CourseVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Processing.instance.allMoney.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoneyCell", for: indexPath) as? Money {
            let firstModel = Processing.instance.allMoney[indexPath.row]
            cell.modelFromCell = firstModel
            cell.configureCell()
            return cell
        }
        
        return UICollectionViewCell()
    }
}
