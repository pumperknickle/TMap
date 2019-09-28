import Foundation
import Bedrock

public struct TMap<Key: BinaryEncodable, Value: Codable>: TrieMap {
    public typealias NodeType = TNode<Value>
    
    private let rawTrueNode: NodeType?
    private let rawFalseNode: NodeType?
    
    public var trueNode: NodeType? { return rawTrueNode }
    public var falseNode: NodeType? { return rawFalseNode }
    
    public init(trueNode: NodeType?, falseNode: NodeType?) {
        self.rawTrueNode = trueNode
        self.rawFalseNode = falseNode
    }
}

public extension TMap {
    func overwrite(with map: TMap) -> TMap {
        return map.elements().reduce(self, { (result, entry) -> TMap in
            return result.setting(key: entry.0, value: entry.1)
        })
    }
}

public extension TMap where Value == [[String]] {
    func prepend(_ key: String) -> TMap<Key, Value> {
        return elements().reduce(TMap<Key, Value>()) { (result, entry) -> TMap<Key, Value> in
            result.setting(key: entry.0, value: entry.1.map { [key] + $0 })
        }
    }
    static func + (lhs: TMap<Key, Value>, rhs: TMap<Key, Value>) -> TMap<Key, Value> {
        return rhs.elements().reduce(lhs) { (result, entry) -> TMap<Key, Value> in
            guard let current = result[entry.0] else { return result.setting(key: entry.0, value: entry.1) }
            return result.setting(key: entry.0, value: entry.1 + current)
        }
    }
}
