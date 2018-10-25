import unittest
import exercise1
import exercise2
from exercise2 import Node

class TestCodingExercise(unittest.TestCase):

	def test_flatten_list(self):
		example_list = [2,[[3,[4]], 5]]
		result = exercise1.flatten_list(example_list)
		flattened = [2, 3, 4, 5]
		self.assertEqual(result, flattened) 

	def test_serialize_tree(self):
		root = Node(1) 
		root.left = Node(2) 
		root.right = Node(3) 
		root.left.right = Node(4) 
		root.right.left = Node(2) 
		result = exercise2.serialize_tree(root)
		serial = [1, 2, 3, None, 4, 2, None]
		self.assertEqual(result, serial) 

if __name__ == '__main__':
	unittest.main()