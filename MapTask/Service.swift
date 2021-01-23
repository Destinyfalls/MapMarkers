//
//  Service.swift
//  MapTask
//
//  Created by Igor Belobrov on 21.01.2021.
//

import Foundation
import Alamofire


class Service {
    
    static let shared = Service()
    
    func getMap(value: String, completion: (([Places]) -> Void)?) {
        AF.request(value, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            guard let data = responseData.data else {return}
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])

                guard let jsonArray = jsonResponse as? [String: Any],
                      let places = jsonArray["places"] as? [[String: Any]] else { return }
                var markers = [Places]()
                places.forEach({markers.append(Places(with: $0)) })
                completion?(markers)
            } catch {
                print("Error decoding == \(error)")
            }
        }
    }
}
