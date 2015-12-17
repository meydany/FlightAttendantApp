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
        let parameters = "utf8=&#x2713;&authenticity_token=+xj+gu4X413A5cxkMXiLq6291XgdZQzIT1ZoaUdcAqN7ReOQ4CJ/ab9n/7HavBDMnC2JLlet++yD4zZ/EzXSPg==&user[username]=34234&user[password]=abcdfs"
        
        let URL = NSURL(string: "https://auth.casenex.com/users/sign_in")
        let mutableURLRequest = NSMutableURLRequest(URL: URL!)
        mutableURLRequest.HTTPMethod = "POST"
        
        do {
            mutableURLRequest.HTTPBody = parameters.dataUsingEncoding(NSUTF8StringEncoding)
        } catch {
            // No-op
        }
        
        Alamofire.request(mutableURLRequest)
            .responseString { response in
                print(response.result)
                print("Response String: \(response.result.value)")
                self.createFile(response.result.value, fileName: "ResponseString")
        }
    }
    
    func createFile(textToWrite: String!, fileName: String!) -> Void {
        let text = textToWrite //just a text
        
        //this is just gonna work for me...idk how to get the project directory
        let dir = "/Users/yolimeydan/Documents/Github Repositories/FlightAttendantApp/FlightAttendantApp/\(fileName).html"
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

