//
//  Places.swift
//  MapTask
//
//  Created by Igor Belobrov on 21.01.2021.
//

import Foundation

class Places: NSObject {
    var id: Int?
    var name: String?
    var lat: Double?
    var lng: Double?
    
    init(with points: [String: Any]) {
        id = points["id"] as? Int
        name = points["name"] as? String ?? ""
        lat = points["lat"] as? Double
        lng = points["lng"] as? Double 
    }
}
