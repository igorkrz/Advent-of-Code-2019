//
//  Day8.swift
//  AdventOfCode 2019
//
//  Created by Igor Krznar on 10/04/2020.
//  Copyright © 2020 Igor Krznar. All rights reserved.
//

import Foundation


class Day8 {
    
    var input: String
    
    var width: Int
    
    var height: Int
    
    init(_ input: String, _ width: Int, _ height: Int) {
        self.input = input
        self.width = width
        self.height = height
    }
    
    func solutionPartTwo() {
        
        var allLayers = [[Int]]()
        
        var selectedLayer = [[Int]]()
        
        // Append string subsequence to integer array
        
        for number in 0 ..< input.count / width {
            
            // Find first and last index
            
            let shift = width * number
            let index = input.index(input.startIndex, offsetBy: shift)
            let element = input[index ... input.index(index, offsetBy: width - 1)]
            
            // Convert string to digits and append to integer array
            
            selectedLayer.append(element.compactMap { $0.wholeNumberValue })
            
            // Group by layers height
            
            if selectedLayer.count == height {
                allLayers.append(selectedLayer.flatMap {$0})
                selectedLayer.removeAll()
            }
        }
        
        // Change values to corresponding pixels
        
        var result = Array(repeating: 2, count: width*height)
           for layer in allLayers {
               for pixel in layer.enumerated() {
                   if result[pixel.offset] == 2 { result[pixel.offset] = pixel.element }
               }
           }
        
        // Print result
        
       print(result.enumerated().reduce(into: "") { (string, pixel) in
           if (pixel.offset % width) == 0 {
               string.append("\n")
           }
           string.append(pixel.element == 1 ? "*" : " ")
       })
        
    }
    
    func solutionPartOne() {
        
        var allLayers = [[Int]]()
        
        var selectedLayer = [Int]()
        
        var max = 0
        
        var sum = 0
        
        // Append string subsequence to integer array
        
        for number in 0 ..< input.count / width {

            // Find first and last index
            
            let shift = width * number
            let index = input.index(input.startIndex, offsetBy: shift)
            let element = input[index ... input.index(index, offsetBy: width - 1)]
            
            // Convert string to digits and append to integer array
            
            allLayers.append(element.compactMap { $0.wholeNumberValue })
            
            // Group each group into layer height
            
            if (number + 1) % height == 0 {
                var nonZeroCount = 0
                selectedLayer = allLayers.flatMap { $0 }.filter { $0 != 0 }
                nonZeroCount += selectedLayer.count
                
                // Find maximum non zero value
                
                if nonZeroCount > max {
                    max = nonZeroCount
                    sum = selectedLayer.filter {$0 == 1}.count * selectedLayer.filter {$0 == 2}.count
                }
                
                // Empty the array and start again
                
                allLayers.removeAll()
            }
        }
        print(sum)
    }
}
