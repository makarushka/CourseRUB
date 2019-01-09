//
//  CourseVC.swift
//  CourseRUB
//
//  Created by Yuriy on 09/01/2019.
//  Copyright © 2019 Yuriy. All rights reserved.
//

import UIKit

class CourseVC: UIViewController{

    let refreshController = UIRefreshControl()
    @IBOutlet private weak var collectionMoney: UICollectionView!
    @IBOutlet private weak var downloadIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        self.collectionMoney.insertSubview(refreshController, at: 0)
        refreshController.addTarget(self, action: #selector(update), for: .valueChanged)
        
        self.collectionMoney.delegate = self
        self.collectionMoney.dataSource = self
        

    }
    
    @objc func update() {
        Processing.instance.downloadAllData {
            DispatchQueue.main.async {
                self.collectionMoney.reloadData()
                self.downloadIndicator.stopAnimating()
            }
        }
        self.refreshController.endRefreshing()
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
