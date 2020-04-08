//
//  main.swift
//  Second
//
//  Created by Igor Krznar on 02/12/2019.
//  Copyright © 2019 Igor Krznar. All rights reserved.
//

import Foundation

class Day2 {
    
    var array: [Int]
    
    init(array: [Int]) {
        self.array = array
    }
    
    func solutionPartOne(_ noun: Int, _ verb: Int) -> Int {
        var newArray = array
        var counter = 0
        newArray[1] = noun
        newArray[2] = verb
        
        while true {
            switch newArray[counter] {
            case 1:
                let addition = newArray[newArray[counter + 1]] + newArray[newArray[counter + 2]]
                newArray[newArray[counter + 3]] = addition
            case 2:
                let multiply = newArray[newArray[counter + 1]] * newArray[newArray[counter + 2]]
                newArray[newArray[counter + 3]] = multiply
            case 99:
                return newArray[0]
            default:
                break
            }
            
            counter += 4
        }
    }
    
    func solutionPartTwo() -> Int {
        let output = 19690720
        var noun = 0
        var verb = 0
        
        while solutionPartOne(noun, verb) != output {
            noun += 1
            if noun > 99 {
                verb += 1
                noun = 0
            }
        }
        return 100 * noun + verb
    }
}
