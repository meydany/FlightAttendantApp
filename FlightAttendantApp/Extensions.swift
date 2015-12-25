//
//  File.swift
//  FlightAttendantApp
//
//  Created by Oran Luzon on 12/25/15.
//  Copyright © 2015 MilkyShakeMobile. All rights reserved.
//

import Foundation

extension String{
    // Substring method where you can put in int values as opposed to indecies
    // (for some reason indicies are a different type thing)
    // mainly for debugging purposes
    func substring(start: Int,end: Int) -> String{
        return self.substringWithRange(self.startIndex.advancedBy(start)..<self.startIndex.advancedBy(end))
    }
    
    // Counts the appearances of a string in another
    func countRepetitions(substring: String) -> Int{
        var repetitions = 0
        var newString = self
        
        if (substring.endIndex > self.endIndex || self.rangeOfString(substring) == nil){
            return 0
        }
        
        // creates a new string after the index of the substring in the original string
        while(newString.rangeOfString(substring) != nil){
            repetitions += 1
            newString = newString.substringWithRange((newString.rangeOfString(substring)?.endIndex)!..<newString.endIndex)
        }
        
        return repetitions
    }
}