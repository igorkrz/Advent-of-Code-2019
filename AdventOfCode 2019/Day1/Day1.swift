//
//  main.swift
//  First
//
//  Created by Igor Krznar on 01/12/2019.
//  Copyright © 2019 Igor Krznar. All rights reserved.
//

import Foundation


class Day1 {
    
    var array: [Int]
    
    init(array: [Int]) {
        self.array = array
    }
    
    func solutionPartOne() {
        print(array.map {$0 / 3 - 2}.reduce(0,+))
    }

    func solutionPartTwo() {
        var sum = 0
        var newArray = array
        while newArray.filter({ $0 > 0 }).count > 1 {
            sum += newArray.map {$0 / 3 - 2}.filter {$0 > 0}.reduce(0,+)
            newArray = newArray.map {$0 / 3 - 2}
        }
        print(sum)
    }
}
