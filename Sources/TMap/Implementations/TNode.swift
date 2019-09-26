import Foundation
import Bedrock

public struct TNode<V: Codable>: Node {
    private let rawPrefix: [Bool]!
    private let rawValue: V?
    private let rawTrueNode: [TNode<V>]!
    private let rawFalseNode: [TNode<V>]!
    
    public var prefix: [Bool]! { return rawPrefix }
    public var value: V? { return rawValue }
    public var trueNode: TNode<V>? { return rawTrueNode.first }
    public var falseNode: TNode<V>? { return rawFalseNode.first }
    
    public init(prefix: [Bool], value: V?, trueNode: TNode<V>?, falseNode: TNode<V>?) {
        self.rawPrefix = prefix
        self.rawValue = value
        self.rawTrueNode = trueNode == nil ? [] : [trueNode!]
        self.rawFalseNode = falseNode == nil ? [] : [falseNode!]
    }
}
