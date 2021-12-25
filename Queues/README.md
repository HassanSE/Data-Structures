# Queues

- Queues are FIFO or first-in first-out ordering, meaning the first element added will always be the first to be removed.
- Queues are handy when you need to maintain the order of your elements to process later.

![image](https://user-images.githubusercontent.com/14030986/147385914-d738ab93-3346-46ed-9bfe-ff8e4b1ffa92.png)

## Common Operations
Let's establish a protocol for queues:

    public protocol Queue {
        associatedtype Element
        mutating func enqueue(_ element: Element) -> Bool
        mutating func dequeue() -> Element?
        var isEmpty: Bool { get }
        var peek: Element? { get }
    }

The protocol describes the core operations for a queue:
- **enqueue**: Insert an element at the back of the queue. Returns true if the operation was successful.
- **dequeue**: Remove the element at the front of the queue and return it.
- **isEmpty**: Check if the queue is empty.
- **peek**: Return the element at the front of the queue without removing it.


Notice that the queue only cares about removal from the front and insertion at the
back. You don’t need to know what the contents are in between. If you did, you
would probably just use an array.

## Array-Based Queue
There are multiple ways to implement Queues in Swift. One of them is by leveraging Array. 
![image](https://user-images.githubusercontent.com/14030986/147387761-d88aa323-0479-4697-bfaa-42166852c579.png)

