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
    static func +(lhs: TMap, rhs: TMap) -> TMap {
        return rhs.elements().reduce(lhs, { (result, entry) -> TMap in
            return result.setting(key: entry.0, value: entry.1)
        })
    }
}
