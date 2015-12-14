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
        
//        Alamofire.request(.GET, "https://httpbin.org/get")
//            .responseJSON { response in
//                print(response.result)
//
//                let json = JSON(data: response.data!)
//                print(json)
//                
//                print(json["origin"])
//                print(json["headers"]["Host"])
//        }
//                
//        let user = "user"
//        let password = "password"
//        
//        Alamofire.request(.GET, "https://httpbin.org/basic-auth/\(user)/\(password)")
//            .authenticate(user: user, password: password)
//            .responseJSON { response in
//                debugPrint(response)
//        }
        
        Alamofire.request(.GET, "https://google.com")
            .responseString { response in
                print("Success: \(response.result.isSuccess)")
                print("Response String: \(response.result.value)")
                self.createFile(response.result.value!, fileName: "GoogleHTML")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func createFile(textToWrite: String!, fileName: String!) -> Void {        
        let text = textToWrite //just a text
        
        //this is just gonna work for me...idk how to get the project directory
        let dir = "/Users/yolimeydan/Documents/Github Repositories/FlightAttendantApp/FlightAttendantApp/\(fileName).txt"
        print(dir)
        //writing
        do {
            try text.writeToFile(dir, atomically: false, encoding: NSUTF8StringEncoding)
        }
        catch {/* error handling here */}
            print("Oh no")
        //reading
        do {
            let text2 = try NSString(contentsOfFile: dir, encoding: NSUTF8StringEncoding)
            print(text2)
        }
        catch {/* error handling here */}
        
    }
}

