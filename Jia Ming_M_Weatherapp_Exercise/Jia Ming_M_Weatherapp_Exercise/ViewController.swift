//
//  ViewController.swift
//  Jia Ming_M_Weatherapp_Exercise
//
//  Created by Jia Ming Mei on 8/13/20.
//  Copyright © 2020 Jia Ming Mei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    if let url = NSURL(string: "https://api.darksky.net/forecast/ae58c5fa7285b492f6a553d200018d9e/42.5917,88.4334") {
                if let data = NSData(contentsOf: url as URL){
                    
        do {
            let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
            
            let newDict = parsed
            
            print(newDict["currently"]!["summary"] as Any)
            print(newDict["currently"]!["termperature"] as Any)
            print(newDict["currently"]!["DewPoint"] as Any)
            
            self.currentTemp.text = "\(newDict["currently"]!["temperature"]!!)"
            self.currentSummary.text = "\(newDict["currently"]!["summary"]!!)"
            self.currentlyDewPoint.text = "\(newDict["currently"]!["dewPoint"]!!)"
            
            }
            
        catch let error as NSError {
            print("A JSON parsithng error occured, here are the details:\n \(error)")
                }
            }
        }
    }
    
    @IBOutlet var currentTemp: UILabel!
    
    @IBOutlet var currentSummary: UILabel!
    
    @IBOutlet var currentlyDewPoint: UILabel!
}






