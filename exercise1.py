# Coding Exercise 1: Flatten Nested List

def flatten_list(nested_list):
	l = []
	def flatten_recursive(nested_list):
		for i in nested_list:
			if not isinstance(i, list):
				l.append(i)
			else:
				flatten_recursive(i)
	flatten_recursive(nested_list)
	return l