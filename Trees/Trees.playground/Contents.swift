
public class Tree<T> {
    var value: T
    var children: [Tree<T>] = []
    var parent: Tree<T>?
    var visits = 0
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func addChild(_ child: Tree<T>) {
        children.append(child)
        child.parent = self
    }
}

extension Tree {
    func performDepthFirstSearch(visit: (Tree) -> Void) {
        visit(self)
        children.forEach { $0.performDepthFirstSearch(visit: visit) }
    }
}

extension Tree: Equatable where T: Equatable {
    public static func == (lhs: Tree<T>, rhs: Tree<T>) -> Bool {
        lhs.value == rhs.value &&
        lhs.visits == rhs.visits &&
        lhs.children == rhs.children
    }
}
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

func doesContainChildren<T: Equatable>(in tree: Tree<T>, child1: T, child2: T) -> Bool {
    tree.children.contains(where: { $0.value == child1 }) &&
    tree.children.contains(where: { $0.value == child2 })
}

func findCommonAncestor<T: Equatable>(tree: Tree<T>, child1: Tree<T>, child2: Tree<T>) -> Tree<T>? {
    var ancestor: Tree<T>? = nil
    if child1.parent == child2.parent {
        return child1.parent
    }
    var parent1 = child1.parent
    var parent2 = child2.parent
    while parent1 != parent2 {
        if parent1?.visits == 1  {
            ancestor = parent1
            break
        } else if parent2?.visits == 1 {
            ancestor = parent2
            break
        } else {
            parent1?.visits += 1
            parent2?.visits += 1
            parent1 = parent1?.parent ?? parent1
            parent2 = parent2?.parent ?? parent2
        }
    }
    ancestor = ancestor == nil ? parent2 : ancestor
    return ancestor
}

//var commonAncestor = findCommonAncestor(tree: tree, child1: blackTea, child2: greenTea)
//print(commonAncestor!.value)
//assert(commonAncestor == tea)
//
//var commonAncestor2 = findCommonAncestor(tree: tree, child1: latte, child2: chaiTea)
//print(commonAncestor2!.value)
//assert(commonAncestor2 == hot)
//
//var commonAncestor3 = findCommonAncestor(tree: tree, child1: gingerAle, child2: hot)
//print(commonAncestor3!.value)
//assert(commonAncestor3 == tree)

var commonAncestor4 = findCommonAncestor(tree: tree, child1: bitterLemon, child2: milk)
print(commonAncestor4!.value)
assert(commonAncestor4 == cold)
