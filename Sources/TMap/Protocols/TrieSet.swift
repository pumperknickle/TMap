import Foundation

public protocol TrieSet: TrieMap where Value == Unit {
    func contains(_ key: Key) -> Bool
    func adding(_ key: Key) -> Self
    func removing(_ key: Key) -> Self
    func toArray() -> [Key]
}

public extension TrieSet {
    func contains(_ key: Key) -> Bool {
        return self[key] != nil
    }
    
    func adding(_ key: Key) -> Self {
        return setting(key: key, value: Unit.void)
    }
    
    func removing(_ key: Key) -> Self {
        return deleting(key: key)
    }
    
    func toArray() -> [Key] {
        return keys()
    }
}
