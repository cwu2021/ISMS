# https://www.guru99.com/python-json.html
import json
# Create a List that contains dictionary
lst = ['a', 'b', 'c',{'4': 5, '6': 7}]
# separator used for compact representation of JSON.
# Use of ',' to identify list items
# Use of ':' to identify key and value in dictionary
compact_obj = json.dumps(lst, separators=(',', ':'))
print(compact_obj)
'''
'["a", "b", "c", {"4": 5, "6": 7}]'
** Here output of JSON is represented in a single line which is the most compact representation 
by removing the space character from compact_obj **
'''
