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
            let task = URLSession.shared.dataTask(with: url) { data, response, Error in
                guard let data = data else {return}
                let decoder = JSONDecoder()
                do {
                    let myStruct = try decoder.decode(ModelMoney.self, from: data)
                    myStruct.valute.forEach() {
                        self.allMoney.append($0.value)
                        complition()
                    }
                    
                } catch let error as NSError {
                    print(error.localizedDescription)
                    
                }
            }
            task.resume()
            
        }
    }
}
