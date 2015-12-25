//
//  Login.swift
//  FlightAttendantApp
//
//  Created by Oran Luzon on 12/25/15.
//  Copyright © 2015 MilkyShakeMobile. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class Login{
    
    init(){
    
    }
    
    func login(){
        
        let username = "oranluzon@walla.com"
        let password = "banana"
        
        //format for myParameters: "nameOfInputField=value&nameOfInputField=value"
        let myParameters = "email=\(username)&pass=\(password)"
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: "https://www.facebook.com/login/")!)
        request.HTTPMethod = "POST"
        request.HTTPBody = myParameters.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil && data != nil else {                                                          // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            let requestStatusCode = response as! NSHTTPURLResponse
            if requestStatusCode.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(requestStatusCode.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            //print("responseString = \(responseString)")
            self.createFile(responseString as! String, fileName: "FacebookHTML2")
            (UIApplication.sharedApplication().keyWindow?.rootViewController! as! ViewController).webView.loadRequest(request)
        }
        task.resume()
        UIApplication.sharedApplication().keyWindow?.rootViewController!.view = (UIApplication.sharedApplication().keyWindow?.rootViewController! as! ViewController).webView
    }
    
    func openFile(fileDir: String){
        var text = ""
        
        do {
            text = try NSString(contentsOfFile: fileDir, encoding: NSUTF8StringEncoding) as String
        }
        catch{}
        
        let parser = Parser(textToWrite: text)
        
        parser.parseClass("_5v0s _5my8")
        parser.parseClass("_5v9v")
        
    }
    
    func createFile(textToWrite: String!, fileName: String!) -> Void {
        let text = textToWrite //just a text
        
        //this is just gonna work for me...idk how to get the project directory
        let dir = "/Users/oranluzon/Desktop/HTMLFolder/\(fileName).html"
        print(dir)
        
        let parser = Parser(textToWrite: text)
        
        print(parser.parseClass("_5v0s _5my8"))
        print(parser.parseClass("_5v9v"))
        print(parser.parseID("_5v0s _5my8"))
        print(parser.parseID("_5v9v"))
        print(parser.combine(parser.parseClass("_5v0s _5my8"), arr2: parser.parseClass("_5v9v")))
        
        //writing
        do {
            try text.writeToFile(dir, atomically: true, encoding: NSUTF8StringEncoding)
        }
        catch {
            /* error handling here */
            print("Oh no")
        }
        
        //reading
        do {
            let text2 = try NSString(contentsOfFile: dir, encoding: NSUTF8StringEncoding)
            //print(text2)
        }
        catch {
            /* error handling here */
        }
        
    }
}