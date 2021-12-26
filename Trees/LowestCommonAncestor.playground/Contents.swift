import Foundation

func findCommonAncestor<T: Equatable>(tree: Tree<T>, node1: Tree<T>, node2: Tree<T>) -> Tree<T>? {
    var ancestor: Tree<T>? = nil
    if node1 == tree || node2 == tree {
        return nil
    }
    if node1.parent == node2.parent {
        return node1.parent
    }
    var parent1 = node1.parent
    var parent2 = node2.parent
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

func verify_lowestCommonAncestor(tree: Tree<String>, child1: String, child2: String, lca: String?) {
    let node1 = tree.search(child1)!
    let node2 = tree.search(child2)!
    let commonAncestor = findCommonAncestor(tree: tree, node1: node1, node2: node2)
    commonAncestor.map { print("Common ancestor of \(child1) and \(child2) is: \($0.value)") }
    assert(commonAncestor?.value == lca)
}

func test_lowestCommonAncestor_shouldReturnLowCommonParentInTree() {
    verify_lowestCommonAncestor(tree: makeBeverageTree(), child1: "Latte", child2: "Hot", lca: "Beverages")
    verify_lowestCommonAncestor(tree: makeBeverageTree(), child1: "Ginger Ale", child2: "Cappuccino", lca: "Beverages")
    verify_lowestCommonAncestor(tree: makeBeverageTree(), child1: "Black Tea", child2: "Coffee", lca: "Hot")
    verify_lowestCommonAncestor(tree: makeBeverageTree(), child1: "Milk", child2: "Cold", lca: "Beverages")
    verify_lowestCommonAncestor(tree: makeBeverageTree(), child1: "Cappuccino", child2: "Chai Tea", lca: "Hot")
    verify_lowestCommonAncestor(tree: makeBeverageTree(), child1: "Cappuccino", child2: "Bitter Lemon", lca: "Beverages")
    verify_lowestCommonAncestor(tree: makeBeverageTree(), child1: "Hot", child2: "Beverages", lca: nil)
    verify_lowestCommonAncestor(tree: makeBeverageTree(), child1: "Green Tea", child2: "Cocoa", lca: "Hot")
}

test_lowestCommonAncestor_shouldReturnLowCommonParentInTree()
