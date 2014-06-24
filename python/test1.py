#!/usr/bin/env python

import unittest

class TestMeNow(unittest.TestCase):
  def very_important_test(self):
    print("if this doesn't run, I'm in big trouble")
    self.assertNotEqual(2 + 2, 4, "They're the same!")

if __name__ == "__main__":
  unittest.main()
