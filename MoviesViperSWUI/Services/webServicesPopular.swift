//
//  webServicesPopular.swift
//  MoviesViperSWUI
//
//  Created by Jose Preatorian on 30-01-26.
//

import Foundation
import UIKit
protocol WebServicesPopularProtocol {
    func getArticles( completion: @escaping ([Result]?) -> ())
}
class webServicesPopular: BaseService {
    var urlbase:String = ""
    func getArticles( completion: @escaping ([Result]?) -> ()) {
        
        guard let endpointData = getEndpoint(fromName: "crearIssue") else { return }
        
        print(endpointData.url)
        
        let url = URL(string: endpointData.url.absoluteString)!
        
        URLSession.shared.dataTask(with: url) { [self] data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                
            } else if let data = data {
              
                let articleList = try? JSONDecoder().decode(MoviesResult.self, from: data)
                print(articleList)
                if let articleList = articleList?.results {
                   
                    completion(articleList)
                }
                
                print(articleList?.results)
                
            }
            
        }.resume()
    }
}
