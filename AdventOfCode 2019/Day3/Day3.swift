//
//  Third.swift
//  AdventOfCode 2019
//
//  Created by Igor Krznar on 26/03/2020.
//  Copyright © 2020 Igor Krznar. All rights reserved.
//

import Foundation

class Day3 {
    
    var array: [[String]]
    var returnArray: [[Int]] = [[0,0]]
    var firstWire = [[Int]]()
    var secondWire = [[Int]]()
    
    init(array: [[String]]) {
        self.array = array
    }
    
    enum Direction: Character {
        case U = "U"
        case D = "D"
        case L = "L"
        case R = "R"
    }
    
    func solutionPartOne() -> [[Int]] {
        
        // For each wire and for each element in wire
        
        for wire in 0 ..< array.count {
            for element in 0 ..< array[wire].count {
                
                // Initialize last added item, direction and step count
                
                let lastItem = returnArray[returnArray.count - 1]
                var newItem = lastItem
                let direction = Direction(rawValue: array[wire][element].first!)
                let count = Int(array[wire][element].dropFirst())!
                
                
                // Add every point to shared array
                
                for _ in 0 ..< count {
                    switch direction {
                    case .U:
                        newItem[0] += 1
                        returnArray.append(newItem)
                    case .D:
                        newItem[0] -= 1
                        returnArray.append(newItem)
                    case .L:
                        newItem[1] -= 1
                        returnArray.append(newItem)
                    case .R:
                        newItem[1] += 1
                        returnArray.append(newItem)
                    default:
                        break
                    }
                }
            }
            
            // Add elements from shared array to each wire
            
            wire == 0 ? (firstWire = returnArray) : (secondWire = returnArray)
            returnArray.removeAll()
            returnArray.append([0,0])
        }
        return Array(Set(firstWire).intersection(Set(secondWire)))
    }
    
    func manhattanDistance(_ arrayCalculateDistance: [[Int]]) {
        print(arrayCalculateDistance.map({abs($0[0]) + abs($0[1])}).sorted()[1])
    }
    
    func solutionPartTwo(_ calculateArray: [[Int]]) {
        
        // Search indexes of intersection in expanded arrays and add them
        
        let intersectionSearchArray = calculateArray
        var returnArray = [Int]()
        
        for step in 1 ..< intersectionSearchArray.count {
            var steps = 0
            if let firstWireIndex: Int = firstWire.firstIndex(of: intersectionSearchArray[step]) {
                steps += firstWireIndex
            }
            if let secondWireIndex: Int = secondWire.firstIndex(of: intersectionSearchArray[step]) {
                steps += secondWireIndex
            }
            returnArray.append(steps)
        }
        print(returnArray.sorted()[1])
    }
}
