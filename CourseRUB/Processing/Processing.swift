//
//  Processing.swift
//  CourseRUB
//
//  Created by Yuriy on 09/01/2019.
//  Copyright © 2019 Yuriy. All rights reserved.
//

import Foundation
import UIKit


class Processing {
    
    static let instance = Processing()
    
    var allMoney: [Valute] = []
    
    func downloadAllData(complition: @escaping DownloadComplited) {
        if let url = URL(string: BASE_URL_REQUEST_STRING) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {return}
                let decoder = JSONDecoder()
                do {
                    let myModel = try decoder.decode(ModelMoney.self, from: data)
                    let valute = myModel.valute
                    
                    for (_, firstValue) in valute {
                        self.allMoney.append(firstValue)
                    }
                    
                    complition()
                    
                    
                } catch let error as NSError {
                    print(error.localizedDescription)
                    
                }
            }
            let queue = DispatchQueue.global(qos: .userInitiated)
            queue.async {
                task.resume()
            }
            
        }
    }
}
