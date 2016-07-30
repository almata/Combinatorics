<p align="center">
    <img src="https://img.shields.io/badge/platform-iOS%208%2B-blue.svg?style=flat-square" alt="Platform: iOS 8+" />
    <img src="https://img.shields.io/badge/language-Swift%202-f48041.svg?style=flat-square" alt="Language: Swift 2" />
    <img src="https://img.shields.io/badge/pod-0.2-green.svg?style=flat-square" alt="CocoaPods compatible" />
    <img src="http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat-square" alt="License: MIT" />
</p>

# Combinatorics

**Combinatorics** contains static functions to generate **_k_**-permutations and **_k_**-combinations (in both cases either with or without repetition) of the **n** elements in an array.

## Compatibility

**Combinatorics** requires iOS 8+ and is compatible with Swift 2 projects.

## Installation

### CocoaPods

Installation for [CocoaPods](https://cocoapods.org) is simple enough:

    use_frameworks!
    pod 'Combinatorics'

And `import Combinatorics` in the files you would like to use it.

### Old school

Just drag the file `Combinatorics.swift` into your project. That is all you really need. Or if you just need a function or two, copy and paste that function into your project. At the end of the day **Combinatorics** is only a collection of static functions that could also be defined as global functions.

## Usage


permutationsWithoutRepetitionFrom<T>(elements: [T], taking: Int) -> [[T]]
	
permutationsWithRepetitionFrom<T>(elements: [T], taking: Int) -> [[T]]	

combinationsWithoutRepetitionFrom<T>(elements: [T], taking: Int) -> [[T]]

combinationsWithRepetitionFrom<T>(elements: [T], taking: Int) -> [[T]]

## Some examples

### Example 1

	// All possible ways to arrange letters [abc].
	let ps = Combinatorics.permutationsWithoutRepetitionFrom(["a", "b", "c"], taking: 3)
	for p in ps { 
		print(p.joinWithSeparator("")) 
	}

Output:

> abc
> acb
> bac
> bca
> cab
> cba

### Example 2

    // All possible numbers created by picking 5 different digits (accepting 0 as the first digit).
    let ps = Combinatorics.permutationsWithoutRepetitionFrom(Array(0...9), taking: 5)
    for p in ps {
        var exp = 100000
        print(p.reduce(0) { exp /= 10; return $0 + $1 * exp })
    }

Output:

> 1234
> 1235
> 1236
> 1237
> [many more numbers]
> 98762
> 98763
> 98764
> 98765

### Example 3

    // All possible binary numbers using exactly 3 bits.
    let prs = Combinatorics.permutationsWithRepetitionFrom(["0", "1"], taking: 3)
    for pr in prs {
        print(pr.joinWithSeparator(""))
    }

Output:

> 000
> 001
> 010
> 011
> 100
> 101
> 110
> 111

### Example 4

    // All possible pizzas you can order with 3 extra ingredients.
    let cs = Combinatorics.combinationsWithoutRepetitionFrom(["bacon", "cheese", "tomato", "olives", "onion"], taking: 3)
    for c in cs {
        print(c)
    }

Output:

> ["bacon", "cheese", "tomato"]
> ["bacon", "cheese", "olives"]
> ["bacon", "cheese", "onion"]
> ["bacon", "tomato", "olives"]
> ["bacon", "tomato", "onion"]
> ["bacon", "olives", "onion"]
> ["cheese", "tomato", "olives"]
> ["cheese", "tomato", "onion"]
> ["cheese", "olives", "onion"]
> ["tomato", "olives", "onion"]

### Example 5

    // All possible ways you can pick 6 numbers out of 6 available.
    let cs = Combinatorics.combinationsWithoutRepetitionFrom([4, 8, 15, 16, 23, 42], taking: 6)
    for c in cs { 
		print(c) 
	}

Output: *don't get lost here, there obviously is only one way - picking all of them, as order does not matter!*

> [4, 8, 15, 16, 23, 42]

### Example 6

    // All possible ways 4 people can order some drinks in a bar serving only soda and beer.
    let crs = Combinatorics.combinationsWithRepetitionFrom(["soda", "beer"], taking: 4)
    for cr in crs {
        let grouped = NSCountedSet(array: cr)
        grouped.forEach({ print("\(grouped.countForObject($0)) × \($0)") })
        print("")
    }

Output:

> 4 × soda
> 
> 3 × soda
> 1 × beer
> 
> 2 × soda
> 2 × beer
> 
> 1 × soda
> 3 × beer
> 
> 4 × beer

## Author

Albert Mata ([@almata](https://twitter.com/almata) on Twitter). Please find some more information about me and my work at my website [albertmata.net](http://www.albertmata.net).

## Hire me

I'm currently based in Barcelona and taking projects (permanent or contractor) all over Europe as long as you are OK with total or partial remote work (say I can be onsite one or two weeks a month if you need it). For more information, please check my projects at [albertmata.net/apps](http://albertmata.net/apps) or contact me at **hello@albertmata.net**.

## License

**Combinatorics** is available under the MIT license. See the LICENSE file for more info. Please file an issue if you have any questions or if you would like to share how you are using this tool.
