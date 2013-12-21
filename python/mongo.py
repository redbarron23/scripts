#!/usr/bin/env python

all_mongo_nodes = [ 
                    'rs1-1', 'rs1-2', 'rs1-3', 
                    'rs2-1', 'rs2-2', 'rs2-3', 
                    'rs3-1', 'rs3-2', 'rs3-3', 
                    'rs4-1', 'rs4-2', 'rs4-3', 
                    'rs5-1', 'rs5-2', 'rs5-3', 
                    'rs6-1', 'rs6-2', 'rs6-3', 
                  ]

primary = ['rs1-1', 'rs2-1', 'rs3-1', 'rs4-1', 'rs5-1', 'rs6-1']

replica = [
                    'rs1-2', 'rs1-3', 
                    'rs2-2', 'rs2-3', 
                    'rs3-2', 'rs3-3', 
                    'rs4-2', 'rs4-3', 
                    'rs5-2', 'rs5-3', 
                    'rs6-2', 'rs6-3', 
          ]
