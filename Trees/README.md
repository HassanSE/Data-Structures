# Trees
The tree is an important data structure and is used for various purposes in software development, such as:

- Representing hierarchical relationships
- Facilitating fast lookup operations
- Managing sorted data

## Node
A tree is made up of nodes. Each node can carry some data and keeps track of its chilren.
![image](https://user-images.githubusercontent.com/14030986/147379223-9b6e0190-61b9-4981-96e3-90849f1ac1b0.png)

## Parent and child
Trees are viewed starting from the top and branching towards the bottom, just like a real tree, only upside-down. Every node (except for the topmost one) connects to exactly one node above it. That node is called a **parent** node. The nodes directly below and connected to it are called its **child** nodes. In a tree, every child has exactly one parent. That's what make a tree, well, a tree.
![image](https://user-images.githubusercontent.com/14030986/147379299-79b4dc3a-e604-4a5c-9551-a8fd72bae658.png)

## Root
- The topmost node in a tree is called the root of the tree
- It is the only node that has no parent:
![image](https://user-images.githubusercontent.com/14030986/147379518-ce1ff8b1-50af-4eea-b23b-08a9bf023a26.png)

## Leaf
- A node is a leaf if it has no children:
![image](https://user-images.githubusercontent.com/14030986/147379533-9d5a45f0-fff9-4ba2-8e61-53b89e2933e3.png)

## Traversal algorithms
Travering through a tree is relatively complicated as compared to linear collections. Depending on the problem at hand, there are different traversal algorithms available to traverse through a tree.

### Depth First Search (DFS)
A technique that starts at the root and visits nodes as deep as it can before backtracking.
