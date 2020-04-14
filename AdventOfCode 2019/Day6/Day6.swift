//
//  Day6.swift
//  AdventOfCode 2019
//
//  Created by Igor Krznar on 31/03/2020.
//  Copyright © 2020 Igor Krznar. All rights reserved.
//

import Foundation


class Day6 {
    
    var dict = [String: String]()
    
    var input: [String]
    
    init(input: [String]) {
        self.input = input
    }
    
    func solutionPartOne() {
        
        // Append dictionary
        
        input.forEach { orbit in
            let orbitPair = orbit.components(separatedBy: ")")
            if orbitPair != [""] {
                dict[orbitPair[1]] = orbitPair[0]
            }
        }
        
        // Initialize root element
        
        let root = "COM"
        
        // Recursively find sum of all elements
    
        func findTotal(_ element: String) -> Int {
            guard element != root else {
                return 0
            }
            
            var total = 0
            total +=  1 + findTotal(dict[element]!)
            return total
        }
        
        var total = 0
        dict.keys.forEach { (key) in
            total += findTotal(key)
        }
        
        print(total)
    }
    
    func solutionPartTwo() {
        let path1 = path(from: "YOU", to: "COM")
        let path2 = path(from: "SAN", to: "COM")

        // Find first intersecting object
        
        let intersection = path1.first { path2.contains($0) }!

        print(path1.firstIndex(of: intersection)! + path2.firstIndex(of: intersection)!)
    }

    func path(from: String, to: String) -> [String] {
        var object = dict[from]!
        var objects = [object]
        while object != to {
            object = dict[object]!
            objects.append(object)
        }
        return objects
    }
}
