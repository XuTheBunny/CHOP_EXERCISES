# Coding Exercise 2: Serialize a Binary Tree

class Node:
	def __init__(self, key): 
		self.data = key 
		self.left = None
		self.right = None

def serialize_tree(root_node): 
	root =  root_node
	def height(node): 
		if node is None: 
			return 0 
		else : 
			l_height = height(node.left) 
			r_height = height(node.right) 
		if l_height > r_height : 
			return l_height+1
		else: 
			return r_height+1

	def serialize_recursive(root , level): 
		if root is None: 
			serial.append(None), 
			return
		if level == 1: 
			serial.append(root.data) 
		elif level > 1 : 
			serialize_recursive(root.left , level-1) 
			serialize_recursive(root.right , level-1)

	h = height(root) 
	serial = []
	for i in range(1, h+1): 
		serialize_recursive(root, i)
	return serial
