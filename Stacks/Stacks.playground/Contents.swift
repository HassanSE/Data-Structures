
public struct Stack<Element> {
    private var storage: [Element] = []
    
    public init() {}
    
    public var isEmpty: Bool {
        storage.isEmpty
    }
    
    public var count: Int {
        storage.count
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    public func peek() -> Element? {
        storage.last
    }
}


var books = Stack<String>()
books.push("Atomic Habits")
books.push("The Psychology of Money")
books.push("Deep Work")

assert(books.count == 3)
assert(books.peek() == "Deep Work")

books.pop()

assert(books.count == 2)
assert(books.peek() == "The Psychology of Money")

books.pop()

assert(books.count == 1)
assert(books.peek() == "Atomic Habits")

books.pop()

assert(books.count == 0)
assert(books.peek() == nil)
