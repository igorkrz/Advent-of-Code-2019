//
//  Day7.swift
//  AdventOfCode 2019
//
//  Created by Igor Krznar on 01/04/2020.
//  Copyright © 2020 Igor Krznar. All rights reserved.
//

import Foundation


class Day7 {
    
    var permutationArray: [[Int]] = [[0, 1, 2, 3, 4]]
    
    var array: [Int]
    
    init(array: [Int]) {
        self.array = array
    }
    
    func solutionPartOne() {
        var max = 0
        var input = 0
        let day5 = Day5Intcode(array: array)
        
        // Find all permutations
        
        permuteWirth(permutationArray[0], permutationArray[0].count - 1)
        
        for permutation in permutationArray {
            input = 0
            for phase in permutation {
                day5.solution([phase, input])
                input = day5.outputValue.last!
            }
            if input > max {
                max = input
            }
        }
        
        print(max)
    }
    
    // Permutation algorithm
    
    func permuteWirth(_ a: [Int], _ n: Int) {
        if n == 0 {
            permutationArray.append(a)
        } else {
            var a = a
            permuteWirth(a, n - 1)
            for i in 0..<n {
                a.swapAt(i, n)
                permuteWirth(a, n - 1)
                a.swapAt(i, n)
            }
        }
    }
}
