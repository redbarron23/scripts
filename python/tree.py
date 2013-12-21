#!/usr/bin/env python
import yaml

with open('tree.yaml', 'r') as f:
    doc = yaml.load(f)
    txt1 = doc["treeroot"]["branch1"]
    print(txt1)
    txt2 = doc["treeroot"]["branch2"]
    print(txt2)
