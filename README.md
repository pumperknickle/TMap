# TMap

Standard Swift dictionaries do not provide deterministic encoding. TMap is a generic dictionary implementation where two TMap's with the same key-value pairs are guaranteed guaranteed to be exactly the same down to the last bit. TMap uses a radix trie to encode the key value information. 

TMap is intended to be used functionally, and therefore, all TMap instances are immutable - new TMap instances are returned in functions instead of modified.

All Keys must conform to BinaryEncodable (instead of Hashable), and values must conform to Codable.

## Installation

### Using Swift Package Manager

Add TMap to Package.swift and the appropriate targets

```swift
dependencies: [
.package(url: "https://github.com/pumperknickle/TMap.git", from: "1.0.0")
]
```

## Usage

### Importing framework

Use TMap by including it in the imports of your swift file

```swift
import Swiftrie
```

### Initialization

Create an empty generic dictionary

```swift
let newMap = TMap<String, [[String]]>()
```

### Setting values to keys

When setting values, a new structure is returned with the new key value pair.

```swift
let key1 = "foo"
let value1 = [["fooValue"]]
let modifiedMap = newMap.setting(key: key1, value: value1)
```

### Getting the values of keys

```swift
let key1 = "foo"
let value = newMap[key1]
```

### Deleting keys

```swift
let key1 = "foo"
let modifiedMap = deleting(key: key1)
```
