//
//  ViewController.swift
//  MakeWeather-starter
//
//  Created by Nikolas Burk on 19/09/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit
import YWeatherAPI

class ViewController: UIViewController {

    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var locationTextfield: UITextField!
    
    var location = "San Francisco"
    
    @IBAction func setLocationButton(_ sender: AnyObject) {
        if let newLocation = locationTextfield.text {
            location = newLocation
            self.getWeatherData(location: location)
        }
    }
    @IBAction func show10DayButton(_ sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getWeatherData(location: location)
    }
    
    func getWeatherData(location: String) {
        YWeatherAPI.sharedManager().todaysForecast(forLocation: location,
                                                   success: { (result: [AnyHashable: Any]?) in
                                                    print(result)
                                                    self.showWeatherData(data: result!)
            },
                                                   failure: { (response: Any?, error: Error?) in
                                                    print(error)
            }
        )
    }
    
    func showWeatherData(data: [AnyHashable: Any]) {
        let minTemp:String = data["lowTemperatureForDay"] as! String
        let maxTemp:String = data["highTemperatureForDay"] as! String
        let description:String = data["shortDescription"] as! String
        
        minTempLabel.text = minTemp + "°"
        maxTempLabel.text = maxTemp + "°"
        descLabel.text = description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

