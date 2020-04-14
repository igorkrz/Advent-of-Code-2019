//
//  main.swift
//  AdventOfCode 2019
//
//  Created by Igor Krznar on 25/03/2020.
//  Copyright © 2020 Igor Krznar. All rights reserved.
//

import Foundation

// Constant

let inputFile = Input()

//let eighth = inputFile.readInput("/Users/igorkrznar/Desktop/Xcode/AdventOfCode 2019/AdventOfCode 2019/Day8/input.txt", .Int, CharacterSet(charactersIn: "\n")) as! [String]
//print(eighth)

let eighth = inputFile.largeInput("/Users/igorkrznar/Desktop/Xcode/AdventOfCode 2019/AdventOfCode 2019/Day8/input.txt")

let day8 = Day8(eighth!, 25, 6)

day8.solutionPartOne()
day8.solutionPartTwo()
