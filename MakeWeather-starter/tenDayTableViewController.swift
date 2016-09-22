//
//  tenDayTableViewController.swift
//  MakeWeather-starter
//
//  Created by Luca Hagel on 9/20/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit
import YWeatherAPI

class tenDayTableViewController: UITableViewController {
    @IBOutlet var forecastTableView: UITableView!
    
    var forecasts: [NSDictionary] = []
    var location: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = location
        self.getWeatherData(location: location)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tenDayCell", for: indexPath) as! tenDayTableViewCell
        
        let forecast: NSDictionary = forecasts[indexPath.row]
        let weatherString: String = "\(forecast["shortDescription"] as! String)(Min: \(forecast["lowTemperatureForDay"] as! String)°, Max: \(forecast["highTemperatureForDay"] as! String)°)"
        cell.weatherLabel.text = weatherString
        
        let date = forecast["kYWADateComponents"] as! DateComponents
        let dateString = "\(date.year!)/\(date.month!)/\(date.day!)"
        cell.dateLabel.text = dateString
        
        return cell
    }
    
    func getWeatherData(location: String) {
        YWeatherAPI.sharedManager().fiveDayForecast(forLocation: location,
                                                    success: { (result: [AnyHashable: Any]?) in
                                                        self.forecasts = result?["index"] as! [NSDictionary]
                                                        self.forecastTableView.reloadData()
                },
                                                   failure: { (response: Any?, error: Error?) in
                                                    print(error)
            }
        )
    }

}
