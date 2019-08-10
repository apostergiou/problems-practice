def findClosestValueInBst1(tree, target):
    return findClosestValueInBstHelper1(tree, target, float("inf"))

def findClosestValueInBst2(tree, target):
    return findClosestValueInBstHelper2(tree, target, float("inf"))

def findClosestValueInBstHelper1(tree, target, closest):
    if tree is None:
        return closest
    if abs(target - closest) > abs(target - tree.value):
        closest = tree.value
    if target < tree.value:
        return findClosestValueInBstHelper1(tree.left, target, closest)
    elif target > tree.value:
        return findClosestValueInBstHelper1(tree.right, target, closest)
    else:
        return closest

def findClosestValueInBstHelper2(tree, target, closest):
    currentNode = tree
    while currentNode is not None:
        if abs(target - closest) > abs(target - currentNode.value):
            closest = currentNode.value
        if target < currentNode.value:
            currentNode = currentNode.left
        elif target > currentNode.value:
            currentNode = currentNode.right
        else:
            break
    return closest

class BST:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

    def insert(self, value):
        if value < self.value:
            if self.left is None:
                self.left = BST(value)
            else:
                self.left.insert(value)
        else:
            if self.right is None:
                self.right = BST(value)
            else:
                self.right.insert(value)
        return self

test = BST(100).insert(5).insert(15).insert(5).insert(2).insert(1).insert(22).insert(101)

print(findClosestValueInBst1(test, 11) == 15)
print(findClosestValueInBst2(test, 11) == 15)
