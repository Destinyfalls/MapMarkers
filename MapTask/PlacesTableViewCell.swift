//
//  PlacesTableViewCell.swift
//  MapTask
//
//  Created by Igor Belobrov on 21.01.2021.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {

    @IBOutlet weak var placeLabel: UILabel!
     
    func configureCell(marker: Places) {
        guard let id = marker.id, let name = marker.name else { return }
        placeLabel.text = "\(String(id)). \(name)"
    }
}
