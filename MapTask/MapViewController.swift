//
//  MapViewController.swift
//  MapTask
//
//  Created by Igor Belobrov on 20.01.2021.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    @IBOutlet weak var tblPlaces: UITableView!

    private var markers = [Places]()
    
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPlace()
        tblPlaces.dataSource = self
        tblPlaces.delegate = self
    }
    
    func configureMap() {
        let camera = GMSCameraPosition.camera(withLatitude: markers.first?.lat ?? 50.449218,
                                              longitude: markers.first?.lng ?? 30.525824,
                                              zoom: 14.0)
        mapView.camera = camera
        markers.forEach { (place) in
            guard let latitude = place.lat, let longitude = place.lng else { return }
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            marker.map = mapView
        }
    }
    
    func getPlace() {
        Service.shared.getMap(value: "https://3lolo.github.io/lat_lng.json") { markers in
            self.markers = markers
            self.configureMap()
            self.tblPlaces.reloadData()
            
        }
    }
    
}

extension MapViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return markers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesCell", for: indexPath) as! PlacesTableViewCell
        let place = markers[indexPath.row]
        cell.configureCell(marker: place)
        cell.selectionStyle = .none
        return cell
    }
}
