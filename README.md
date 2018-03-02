<p align="center">
    <img src="https://img.shields.io/badge/platform-iOS%208%2B-blue.svg?style=flat-square" alt="Platform: iOS 8+" />
    <img src="https://img.shields.io/badge/language-Swift%204-f48041.svg?style=flat-square" alt="Language: Swift 4" />
    <img src="https://img.shields.io/badge/pod-1.0-green.svg?style=flat-square" alt="CocoaPods compatible" />
    <img src="http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat-square" alt="License: MIT" />
</p>

# Combinatorics

**Combinatorics** contains static functions to generate **_k_**-permutations and **_k_**-combinations (in both cases either with or without repetition) of the **n** elements in an array.

## Compatibility

**Combinatorics** requires iOS 8+ and is compatible with Swift 4 projects.

## Installation

### CocoaPods

Installation for [CocoaPods](https://cocoapods.org) is simple enough:

    use_frameworks!
    pod 'Combinatorics'

And `import Combinatorics` in the files you would like to use it.

### Carthage

Install [Carthage](https://github.com/Carthage/Carthage) and add this to your Cartfile:

	github "almata/Combinatorics"

### Old school

Just drag the file `Combinatorics.swift` into your project. That is all you really need. Or if you just need a function or two, copy and paste that function into your project. At the end of the day **Combinatorics** is only a collection of static functions that could also be defined as global functions.

## A bit of theory

In natural English the word combination is used to refer to the action of taking some or all of the elements of a list, with or without repetition and caring or not about their order. But in mathematics there are different concepts for these things depending on whether repeated elements are or are not allowed and whether or not the order of the elements matters. Combinatorics, and more specifically [enumerative combinatorics](https://en.wikipedia.org/wiki/Combinatorics#Enumerative_combinatorics) concentrates on counting the number of certain combinatorial objects, for instance providing a unified framework for counting permutations, combinations and partitions.

**Combinatorics** (this library) includes functions for four different scenarios:

1. If the order of the elements does matter and repeated elements are not allowed, it is a permutation without repetition.
2. If the order of the elements does matter and repeated elements are allowed, it is a permutation with repetition.
3. If the order of the elements does not matter and repeated elements are not allowed, it is a combination without repetition. 
4. If the order of the elements does not matter and repeated elements are allowed, it is a combination with repetition.

### Permutations

According to Wikipedia, the notion of [permutation](https://en.wikipedia.org/wiki/Permutation) relates to the act of arranging all the members of a set into some sequence or order, or if the set is already ordered, rearranging (reordering) its elements, a process called permuting. These differ from combinations, which are selections of some members of a set where order is disregarded. For example, written as tuples, there are six permutations of the set {1,2,3}, namely: (1,2,3), (1,3,2), (2,1,3), (2,3,1), (3,1,2), and (3,2,1). These are all the possible orderings of this three element set. As another example, an anagram of a word, all of whose letters are different, is a permutation of its letters. In this example, the letters are already ordered in the original word and the anagram is a reordering of the letters. The study of permutations of finite sets is a topic in the field of combinatorics.

A weaker meaning of the term "permutation", sometimes used in elementary combinatorics texts, designates those ordered arrangements in which no element occurs more than once, but without the requirement of using all the elements from a given set. These are not permutations except in special cases, but are natural generalizations of the ordered arrangement concept. Indeed, this use often involves considering arrangements of a fixed length *k* of elements taken from a given set of size *n*, in other words, these *k*-permutations of *n* are the different ordered arrangements of a *k*-element subset of an *n*-set (sometimes called variations in the older literature.) These objects are also known as partial permutations or as sequences without repetition, terms that avoid confusion with the other, more common, meaning of "permutation".

Finally, sometimes we find the terms "variations without repetition" or "variations with repetition". These are archaic terms in combinatorics still commonly used by non-English authors for *k*-permutations of *n* (in this library, permutations without repetition) and for *n*-tuples (in this library, permutations with repetition) respectively. 

### Combinations

And, according to Wikipedia once more, a [combination](https://en.wikipedia.org/wiki/Combination) is a way of selecting items from a collection, such that (unlike permutations) the order of selection does not matter. In smaller cases it is possible to count the number of combinations. For example, given three fruits, say an apple, an orange and a pear, there are three combinations of two that can be drawn from this set: an apple and a pear; an apple and an orange; or a pear and an orange. More formally, a *k*-combination of a set *S* is a subset of *k* distinct elements of *S*. If the set has *n* elements, the number of *k*-combinations is equal to the binomial coefficient indexed by *n* and *k*.

## Usage

As said before, **Combinatorics** (this library) includes functions for four different scenarios:

1. If the order of the elements does matter and repeated elements are not allowed, it is a permutation without repetition.
2. If the order of the elements does matter and repeated elements are allowed, it is a permutation with repetition.
3. If the order of the elements does not matter and repeated elements are not allowed, it is a combination without repetition. 
4. If the order of the elements does not matter and repeated elements are allowed, it is a combination with repetition.

All functions are defined as `public static` and rely on no other private function at all, so it's actually possible to just copy and paste a specific function into your code. For simplicity and consistency reasons, all functions take the set of elements as an array of `T` elements and also return the corresponding subset as an array of arrays of `T` elements. However, please note that for combinations only the presence of the elements in an array, but not their order, matters.

Finally, all functions are defined as generic, so permutations and combinations of any element can be computed easily.

### Permutation without repetition

```swift
permutationsWithoutRepetitionFrom<T>(elements: [T], taking: Int) -> [[T]]
```

Given an array of `elements` and how many of them we are `taking`, returns an array with all possible permutations without repetition. Please note that as repetition is not allowed, `taking` must always be less or equal to `elements.count`.

Almost by convention, if `taking` is 0, the function will return `[[]]` (an array with only one possible permutation - a permutation with no elements). In a different scenario, if `taking` is bigger than `elements.count` the function will return `[]` (an empty array, so including no permutation at all).

### Permutation with repetition

```swift
permutationsWithRepetitionFrom<T>(elements: [T], taking: Int) -> [[T]]	
```

Given an array of `elements` and how many of them we are `taking`, returns an array with all possible permutations with repetition. Please note that as repetition is allowed, `taking` does not need to be less or equal to `elements.count`.

Almost by convention, if `taking` is 0, the function will return `[[]]` (an array with only one possible permutation - a permutation with no elements). In a different scenario, if `taking` is bigger than 0 but `elements` contains no elements, the function will return `[]` (an empty array, so including no permutation at all).

### Combination without repetition

```swift
combinationsWithoutRepetitionFrom<T>(elements: [T], taking: Int) -> [[T]]
```

Given an array of `elements` and how many of them we are `taking`, returns an array with all possible combinations without repetition. Please note that as repetition is not allowed, `taking` must always be less or equal to `elements.count`.

Almost by convention, if `taking` is 0, the function will return `[[]]` (an array with only one possible combination - a combination with no elements). In a different scenario, if `taking` is bigger than `elements.count` the function will return `[]` (an empty array, so including no combination at all).

Remember that, as combinations do not care about order, these two combinations represent exactly the same set of elements: [1,2,3] and [3,2,1].

### Combination with repetition

```swift
combinationsWithRepetitionFrom<T>(elements: [T], taking: Int) -> [[T]]
```

Given an array of `elements` and how many of them we are `taking`, returns an array with all possible combinations with repetition. Please note that as repetition is allowed, `taking` does not need to be less or equal to `elements.count`.

Almost by convention, if `taking` is 0, the function will return `[[]]` (an array with only one possible combination - a combination with no elements). In a different scenario, if `taking` is bigger than 0 but `elements` contains no elements, the function will return `[]` (an empty array, so including no combination at all).

Remember that, as combinations do not care about order, these two combinations represent exactly the same set of elements: [1,2,2,3] and [3,2,1,2].

## Some examples

### Example 1

```swift
// All possible ways to arrange letters [abc].
let ps = Combinatorics.permutationsWithoutRepetitionFrom(["a", "b", "c"], taking: 3)
for p in ps { 
	print(p.joinWithSeparator("")) 
}
```

Output:

    abc
    acb
    bac
    bca
    cab
    cba

### Example 2

```swift
// All possible numbers created by picking 5 different digits (accepting 0 as the first digit).
let ps = Combinatorics.permutationsWithoutRepetitionFrom(Array(0...9), taking: 5)
for p in ps {
    var exp = 100000
    print(p.reduce(0) { exp /= 10; return $0 + $1 * exp })
}
```

Output:

    1234
    1235
    1236
    1237
    [many more numbers]
    98762
    98763
    98764
    98765

### Example 3

```swift
// All possible binary numbers using exactly 3 bits.
let prs = Combinatorics.permutationsWithRepetitionFrom(["0", "1"], taking: 3)
for pr in prs {
    print(pr.joinWithSeparator(""))
}
```

Output:

    000
    001
    010
    011
    100
    101
    110
    111

### Example 4

```swift
// All possible pizzas you can order with 3 extra ingredients.
let cs = Combinatorics.combinationsWithoutRepetitionFrom(["bacon", "cheese", "tomato", "olives", "onion"], taking: 3)
for c in cs {
    print(c)
}
```

Output:

    ["bacon", "cheese", "tomato"]
    ["bacon", "cheese", "olives"]
    ["bacon", "cheese", "onion"]
    ["bacon", "tomato", "olives"]
    ["bacon", "tomato", "onion"]
    ["bacon", "olives", "onion"]
    ["cheese", "tomato", "olives"]
    ["cheese", "tomato", "onion"]
    ["cheese", "olives", "onion"]
    ["tomato", "olives", "onion"]

### Example 5

```swift
// All possible ways you can pick 6 numbers out of 6 available.
let cs = Combinatorics.combinationsWithoutRepetitionFrom([4, 8, 15, 16, 23, 42], taking: 6)
for c in cs { 
	print(c) 
}
```

Output: *don't get lost here, there obviously is only one way - picking all of them, as order does not matter!*

    [4, 8, 15, 16, 23, 42]

### Example 6

```swift
// All possible ways 4 people can order some drinks in a bar serving only soda and beer.
let crs = Combinatorics.combinationsWithRepetitionFrom(["soda", "beer"], taking: 4)
for cr in crs {
    let grouped = NSCountedSet(array: cr)
    grouped.forEach({ print("\(grouped.countForObject($0)) × \($0)") })
    print("")
}
```

Output:

    4 × soda
    
    3 × soda
    1 × beer
    
    2 × soda
    2 × beer
    
    1 × soda
    3 × beer
    
    4 × beer

## Author

Albert Mata ([@almata](https://twitter.com/almata) on Twitter). Please find some more information about me and my work at my website [albertmata.net](http://www.albertmata.net).

## Hire me

I'm currently based in Barcelona and taking projects (permanent or contractor) all over Europe as long as you are OK with total or partial remote work (say I can be onsite one or two weeks a month if you need it). For more information, please check my projects at [albertmata.net/apps](http://albertmata.net/apps) or contact me at **hello@albertmata.net**.

## License

**Combinatorics** is available under the MIT license. See the LICENSE file for more info. Please file an issue if you have any questions or if you would like to share how you are using this tool.
