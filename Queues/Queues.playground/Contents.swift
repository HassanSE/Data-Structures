import Foundation

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

// enqueue: Insert an element at the back of the queue. Returns true if the operation was successful.
// dequeue: Remove the element at the front of the queue and return it.
// isEmpty: Check if the queue is empty.
// peek: Return the element at the front of the queue without removing it.

public struct QueueArray<T>: Queue {
    private var array: [T] = []
    public init() { }
    
    public var isEmpty: Bool { array.isEmpty }
    
    public var peek: T? { array.first }
    
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        isEmpty ? nil : array.removeFirst()
    }
}

// Removing an element from the front of the queue is an O(n) operation. To dequeue,
// you remove the element from the beginning of the array. This is always a linear-time
// operation because it requires all the remaining elements in the array to be shifted in
// memory.

extension QueueArray: CustomStringConvertible {
    public var description: String {
        String(describing: array)
    }
}

var queue = QueueArray<String>()
queue.enqueue("Ray")
queue.enqueue("Brian")
queue.enqueue("Eric")
queue
queue.dequeue()
queue
queue.peek
queue
