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
        
        let username = "myUsername"
        let password = "myPassword"
        let myParameters = "email=\(username)&pass=\(password)"
        
       
        let request = NSMutableURLRequest(URL: NSURL(string: "https://www.facebook.com/login/")!)
        request.HTTPMethod = "POST"
        request.HTTPBody = myParameters.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil && data != nil else {                                                          // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
            self.createFile(responseString as! String, fileName: "FacebookHTML")
        }
        task.resume()
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

