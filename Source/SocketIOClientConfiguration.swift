
public struct SocketIOClientConfiguration : ExpressibleByArrayLiteral, Collection, MutableCollection {
    public typealias Element = SocketIOClientOption
    public typealias Index = Array<SocketIOClientOption>.Index
    public typealias Generator = Array<SocketIOClientOption>.Generator
    public typealias SubSequence =  Array<SocketIOClientOption>.SubSequence
    
    private var backingArray = [SocketIOClientOption]()
    
    public var startIndex: Index {
        return backingArray.startIndex
    }
    
    public var endIndex: Index {
        return backingArray.endIndex
    }
    
    public var isEmpty: Bool {
        return backingArray.isEmpty
    }
    
    public var count: Index.Stride {
        return backingArray.count
    }
    
    public var first: Generator.Element? {
        return backingArray.first
    }
    
    public subscript(position: Index) -> Generator.Element {
        get {
            return backingArray[position]
        }
        
        set {
            backingArray[position] = newValue
        }
    }
    
    public subscript(bounds: Range<Index>) -> SubSequence {
        get {
            return backingArray[bounds]
        }
        
        set {
            backingArray[bounds] = newValue
        }
    }
    
    public init(arrayLiteral elements: Element...) {
        backingArray = elements
    }
    
    public func generate() -> Generator {
        return backingArray.makeIterator()
    }
    
    public func index(after i: Index) -> Index {
        return backingArray.index(after: i)
    }
    
    public mutating func insert(_ element: Element, replacing replace: Bool = true) {
        for i in 0..<backingArray.count where backingArray[i] == element {
            guard replace else { return }
            
            backingArray[i] = element
            
            return
        }
        
        backingArray.append(element)
    }
    
    public func prefix(upTo end: Index) -> SubSequence {
        return backingArray.prefix(upTo: end)
    }
    
    public func prefix(through position: Index) -> SubSequence {
        return backingArray.prefix(through: position)
    }
    
    public func suffix(from start: Index) -> SubSequence {
        return backingArray.suffix(from: start)
    }
}
