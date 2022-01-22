import json
# https://docs.python.org/3/library/json.html
# https://www.guru99.com/python-json.html
# https://stackoverflow.com/questions/12934699/selecting-fields-from-json-output
# https://www.geeksforgeeks.org/print-lists-in-python-4-different-ways/
jsonFile = open('data.json', 'r')
values = json.load(jsonFile)
for x in range(len(values['detections'])):
    print(values['detections'][x]['country'])
jsonFile.close
