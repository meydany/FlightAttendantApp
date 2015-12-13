//
//  ViewController.swift
//  FlightAttendantApp
//
//  Created by Yoli Meydan on 12/13/15.
//  Copyright © 2015 MilkyShakeMobile. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "https://httpbin.org/get")
            .responseJSON { response in
                print(response.result)

                let json = JSON(data: response.data!)
                print(json)
                
                print(json["origin"])
                print(json["headers"]["Host"])
        }
                
        let user = "user"
        let password = "password"
        
        Alamofire.request(.GET, "https://httpbin.org/basic-auth/\(user)/\(password)")
            .authenticate(user: user, password: password)
            .responseJSON { response in
                debugPrint(response)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

