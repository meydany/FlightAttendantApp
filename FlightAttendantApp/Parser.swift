//
//  Parser.swift
//  FlightAttendantApp
//
//  Created by Oran Luzon on 12/24/15.
//  Copyright © 2015 MilkyShakeMobile. All rights reserved.
//

import Foundation

class Parser{
    let text: String
    
    init(textToWrite: String!){
        text = textToWrite
    }
    
    // NOTE - we should eventually parse the website once so that we get a file of everything we will need
    // For now i will do a search for every individual thing every time
    
    // Finding text in between the tags of a class 
    // return an array of text
    func parseClass(tag: String!) -> [String]{
        if (tag.isEmpty || text.isEmpty){
            print("Empty")
            return [""]
        }
        
        if (text.rangeOfString(tag) != nil){
            return searchLetterRepetitions(tag)
        }
        else{
            print("Isn't Contained")
            return [""]
        }
    }
    
    // Basically like parseClass except it only finds the first one
    func parseID(tag: String) -> String{
        return searchLetterRepetitions(tag)[0]
    }
    
    // This function searches thorugh the file for the text between the tags with class/id of tag
    // The only real reason for this to be seperate is that it's more 
    // of the logic as opposed to the parseClass which is like the outline idk k
    private func searchLetterRepetitions(tag: String) -> [String]{
        // Just random initializer values
        var letterIndex = text.startIndex
        var letter = ""
        
        // Starts off the value array with empty strings
        var value = [String](count: text.countRepetitions(tag), repeatedValue: "")
        var newString = text
        
        for i in 0..<newString.countRepetitions(tag){
            // Starts the search at the end of the tag
            letterIndex = newString.rangeOfString(tag)!.endIndex
            letter = ""
            
            // Finds the closing tag before recording the text
            while (letter != ">"){
                // Goes to the next index and sets letter to that value
                letterIndex = letterIndex.successor()
                letter = newString.substringWithRange(letterIndex..<letterIndex.successor())
            }
            
            // Skips the closing tag so it isn't recorded
            letterIndex = letterIndex.successor()
            letter = newString.substringWithRange(letterIndex..<letterIndex.successor())
            
            // Records text
            while(letter != "<"){
                // Same idea as before except it records it into value
                value[i].appendContentsOf(letter)
                letterIndex = letterIndex.successor()
                letter = newString.substringWithRange(letterIndex..<letterIndex.successor())
            }
            
            // After it finishes recording the string it creates a new string that starts right after it
            // This is so that it wont see the same tag again
            // Don't bother trying to understand it your brain is too weak
            newString = newString.substringWithRange((newString.rangeOfString(tag)?.endIndex)!.advancedBy(value[i].characters.count)..<newString.endIndex)
            
        }
        
        return value
    }
    
    // combines every element of two arrays of strings to form one
    func combine(arr1: [String], arr2: [String]) -> [String]{
        var finalArr = [String](count: arr1.count, repeatedValue: "")
        
        if (arr1.count != arr2.count){
            print("Arrays unequal")
            return finalArr
        }
        
        for i in 0..<arr1.count{
            finalArr[i] = arr1[i] + arr2[i]
        }
        
        return finalArr
    }
}

















