#!/usr/bin/env python
import subprocess

p = subprocess.Popen(['ls', '-a'], stdout=subprocess.PIPE,
                                   stderr=subprocess.PIPE)
out, err = p.communicate()
print(out)

