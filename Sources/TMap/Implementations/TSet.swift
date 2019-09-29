import Foundation
import Bedrock

public struct TSet<Element: BinaryEncodable>: TrieSet {
    public typealias Key = Element
    public typealias NodeType = TNode<Unit>
    
    private let rawTrueNode: NodeType?
    private let rawFalseNode: NodeType?
    
    public var trueNode: NodeType? { return rawTrueNode }
    public var falseNode: NodeType? { return rawFalseNode }
    
    public init(trueNode: NodeType?, falseNode: NodeType?) {
        self.rawTrueNode = trueNode
        self.rawFalseNode = falseNode
    }
}
