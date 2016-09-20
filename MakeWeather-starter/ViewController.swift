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

  override func viewDidLoad() {
    super.viewDidLoad()

    YWeatherAPI.sharedManager().todaysForecast(forLocation: "San Francisco",
                                               success: { (result: [AnyHashable: Any]?) in
                                                print(result) },
                                               failure: { (response: Any?, error: Error?) in
                                                print(error)
      }
    )
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

