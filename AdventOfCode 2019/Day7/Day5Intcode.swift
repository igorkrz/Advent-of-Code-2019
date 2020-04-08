//
//  Day5.swift
//  AdventOfCode 2019
//
//  Created by Igor Krznar on 30/03/2020.
//  Copyright © 2020 Igor Krznar. All rights reserved.
//

import Foundation

class Day5Intcode {
    
    var array: [Int]
    
    var outputValue = [Int]()
    var final = false
    
    init(array: [Int]) {
        self.array = array
    }
    
    func solution(_ inputSignal: [Int]) {
        var newArray = array
        //let inputValue = ID
        
        var counter = 0
        
        var input = inputSignal
        
        while true {
            
            switch newArray[counter] % 100 {
                
            case 1:
                
                let parameters = setParameters(newArray, counter)
                
                let addition = parameters[0] + parameters[1]
                
                newArray[newArray[counter + 3]] = addition
                
                counter += 4
                
            case 2:
                
                let parameters = setParameters(newArray, counter)
                
                let multiply = parameters[0] * parameters[1]
                
                newArray[newArray[counter + 3]] = multiply
                
                counter += 4
               
            case 3:
                
                if input.isEmpty {
                    counter -= 2
                    return
                }
                
                newArray[newArray[counter + 1]] = input.removeFirst()
                
                counter += 2
                
                
            case 4:
                
                outputValue.append(newArray[newArray[counter + 1]])
                
                counter += 2
                
            case 5:
                
                let parameters = setParameters(newArray, counter)
                
                if parameters[0] != 0 { counter = parameters[1] }
                
                else { counter += 3 }
                
            case 6:
            
                let parameters = setParameters(newArray, counter)
                
                if parameters[0] == 0 { counter = parameters[1] }
                
                else { counter += 3 }
                
            case 7:
                
                let parameters = setParameters(newArray, counter)
                
                newArray[newArray[counter + 3]] = parameters[0] < parameters[1] ? 1 : 0
                
                counter += 4
                
                
            case 8:
                
                let parameters = setParameters(newArray, counter)
                
                newArray[newArray[counter + 3]] = parameters[0] == parameters[1] ? 1 : 0
                
                counter += 4
                
            case 99:
                
                final = true
                
                return
                
            default:
                
                fatalError()
                
            }
        }
    }
    
    
    func getDigits(_ firstInstruction: Int) -> [Int] {
        var stringFirstInstruction: String
        var digitsFirstInstruction: [Int]
        
        // Convert opcode to digits
        
        stringFirstInstruction = String(firstInstruction)
        digitsFirstInstruction = stringFirstInstruction.compactMap { $0.wholeNumberValue }
        
        // If there are only 3 digits, append 0 at first position
        
        if digitsFirstInstruction.count == 3 { digitsFirstInstruction.insert(0, at: 0) }
        
        return digitsFirstInstruction
    }
    
    func setParameters(_ newArray: [Int], _ pointer: Int) -> [Int] {
        var firstParameter = 0
        var secondParameter = 0
        var returnArray = [Int]()

        if newArray[pointer] >= 100 {
            
            // Immediate or position mode
            
            let digits = getDigits(newArray[pointer])
            if digits[1] == 1 { firstParameter = newArray[pointer + 1] }
            else { firstParameter = newArray[newArray[pointer + 1]] }
            if digits[0] == 1 { secondParameter = newArray[pointer + 2] }
            else { secondParameter = newArray[newArray[pointer + 2]] }
            
        }
        
        else {
            
            // Position mode
            
            firstParameter = newArray[newArray[pointer + 1]]
            secondParameter = newArray[newArray[pointer + 2]]
        }
        
        returnArray.append(firstParameter)
        returnArray.append(secondParameter)
        
        return returnArray
    }
    
}
