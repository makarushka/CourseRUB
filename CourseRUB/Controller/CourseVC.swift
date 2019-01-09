//
//  CourseVC.swift
//  CourseRUB
//
//  Created by Yuriy on 09/01/2019.
//  Copyright © 2019 Yuriy. All rights reserved.
//

import UIKit

class CourseVC: UIViewController{

    @IBOutlet weak var collectionMoney: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        Processing.instance.downloadAllData {
            self.collectionMoney.reloadData()
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
