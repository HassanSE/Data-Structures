public class Tree<T> {
    public var value: T
    public var children: [Tree<T>] = []
    public var parent: Tree<T>?
    public var visits = 0
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func addChild(_ child: Tree<T>) {
        children.append(child)
        child.parent = self
    }
}

extension Tree: Equatable where T: Equatable {
    public static func == (lhs: Tree<T>, rhs: Tree<T>) -> Bool {
        lhs.value == rhs.value &&
        lhs.parent == rhs.parent &&
        lhs.children == rhs.children
    }
}

extension Tree {
    public func performDepthFirstSearch(visit: (Tree) -> Void) {
        visit(self)
        children.forEach { $0.performDepthFirstSearch(visit: visit) }
    }
}

extension Tree {
    public func performBreadthFirstSearch(visit: (Tree) -> Void) {
        visit(self)
        var queue = QueueArray<Tree>()
        children.forEach { queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
}

public func makeBeverageTree() -> Tree<String> {
    let tree = Tree<String>("Beverages")
    
    let hot = Tree("Hot")
    let cold = Tree("Cold")
    
    let tea = Tree("Tea")
    let coffee = Tree("Coffee")
    let chocolate = Tree("Cocoa")
    
    let blackTea = Tree("Black Tea")
    let greenTea = Tree("Green Tea")
    let chaiTea = Tree("Chai Tea")
    
    let latte = Tree("Latte")
    let cappuccino = Tree("Cappuccino")
    
    let soda = Tree("Soda")
    let milk = Tree("Milk")
    
    let gingerAle = Tree("Ginger Ale")
    let bitterLemon = Tree("Bitter Lemon")
    
    tree.addChild(hot)
    tree.addChild(cold)
    
    hot.addChild(tea)
    hot.addChild(coffee)
    hot.addChild(chocolate)
    
    tea.addChild(blackTea)
    tea.addChild(greenTea)
    tea.addChild(chaiTea)
    
    coffee.addChild(latte)
    coffee.addChild(cappuccino)
    
    cold.addChild(soda)
    cold.addChild(milk)
    
    soda.addChild(gingerAle)
    soda.addChild(bitterLemon)
    
    return tree
}

extension Tree where T: Equatable {
    public func search(_ value: T) -> Tree? {
        var result: Tree?
        performBreadthFirstSearch { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}

