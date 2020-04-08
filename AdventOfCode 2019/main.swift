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

/*
 
// Solution day 1
 
let first = inputFile.readInput("/Users/igorkrznar/Desktop/Xcode/AdventOfCode 2019/AdventOfCode 2019/Day1/input.txt", .Int, CharacterSet(charactersIn: "\n"))

let day1 = Day1(array: first as! [Int])
print(day1.solutionPartOne())
print(day1.solutionPartTwo())


// Solution day 2
 
let second = inputFile.readInput("/Users/igorkrznar/Desktop/Xcode/AdventOfCode 2019/AdventOfCode 2019/Day2/input.txt", .Int, CharacterSet(charactersIn: ","))

let day2 = Day2(array: second as! [Int])
print(day2.solutionPartOne(12, 2))
print(day2.solutionPartTwo())
 


// Solution day 3

let third = inputFile.readInput("/Users/igorkrznar/Desktop/Xcode/AdventOfCode 2019/AdventOfCode 2019/Day3/input.txt", .String, CharacterSet(charactersIn: ","))
var arrayDay3 = third as! [String]
if let newArray = inputFile.splitArray(arrayDay3, "\n") {
    let day3 = Day3(array: newArray)
    let intersections = day3.findIntersections()
    print(day3.manhattanDistance(intersections))
    print(day3.calculateSteps(intersections))
}



// Solution day 4

let day4 = Day4(passwordRange: 168630...718098)
print(day4.checkPassword())

*/

// Solution day 5

let fifth = inputFile.readInput("/Users/igorkrznar/Desktop/Xcode/AdventOfCode 2019/AdventOfCode 2019/Day5/input.txt", .Int, CharacterSet(charactersIn: ","))

let day5 = Day5(array: fifth as! [Int], ID: 1)
print(day5.solution())

let day5Part2 = Day5(array: fifth as! [Int], ID: 5)
print(day5Part2.solution())



/*
// Solution day 6

let sixth = inputFile.readInput("/Users/igorkrznar/Desktop/Xcode/AdventOfCode 2019/AdventOfCode 2019/Day6/input.txt", .String, CharacterSet(charactersIn: "\n"))
let day6 = Day6(input: sixth as! [String])
print(day6.orbitsCount())
print(day6.orbitalTransfer())
*/



// Solution day 7


let seventh = inputFile.readInput("/Users/igorkrznar/Desktop/Xcode/AdventOfCode 2019/AdventOfCode 2019/Day7/input.txt", .Int, CharacterSet(charactersIn: ","))

let day7 = Day7(array: seventh as! [Int])

day7.solvePartOne()
