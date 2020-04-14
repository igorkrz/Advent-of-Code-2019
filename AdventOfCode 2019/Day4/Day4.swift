//
//  Day4.swift
//  AdventOfCode 2019
//
//  Created by Igor Krznar on 28/03/2020.
//  Copyright © 2020 Igor Krznar. All rights reserved.
//

import Foundation


class Day4 {
    
    var passwordRange: ClosedRange<Int>
    
    var adjacentDictionary: Dictionary = [1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0]
    
    init(passwordRange: ClosedRange<Int>) {
        self.passwordRange = passwordRange
    }
    
    func solution() {
        
        var passwords = [Int]()
        
        // Check each possibility in password range
        
        for possibility in passwordRange {
            
            // Convert Int to String and then String to Int array of digits
            
            let stringPassword = String(possibility)
            let digits = stringPassword.compactMap { $0.wholeNumberValue }
            
            // Check for conditions
            
            if neverDecrease(digits) && checkAdjacent(digits) {
                passwords.append(possibility)
            }
        }
        print(passwords.count)
    }
    
    func neverDecrease(_ digits: [Int]) -> Bool {
        var count = 0
        for number in 1 ..< digits.count {
            if digits[number] >= digits[number - 1] {
                count += 1
                if count == 5 {
                    return true
                }
            }
        }
        return false
    }
    
    func checkAdjacent(_ digits: [Int]) -> Bool {
        
        // Reset dictionary
        
        adjacentDictionary.keys.forEach { adjacentDictionary[$0] = 0}
        
        // Append occurances of each number into dictionary
        
        for number in digits {
            adjacentDictionary[number]! += 1
        }
        
        // Part one
        
//        if adjacentDictionary.filter ({ $0.value >= 2 }).count > 0 {
//            return true
//        }
        
        // Part two
        
        if adjacentDictionary.filter ({ $0.value == 2 }).count >= 1 {
            return true
        }
        
        return false
    }
}
