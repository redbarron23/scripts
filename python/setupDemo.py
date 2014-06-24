#!/usr/bin/env python

"""
Demonstration of setUp and tearDown.
The testd do not actuall test anything - this is a demo.
"""

import unittest
import tempfile
import shutil
import glob
import os

class FileTest(unittest.TestCase):

    def setUp(self):
        self.origdir = os.getcwd()
        self.dirname = tempfile.mkdtemp("testdir")
        print("Created", self.dirname)
        os.chdir(self.dirname)

    def test_1(self):
        "Verify creation of files is possible"
        for filename in ("this.txt", "that.txt", "the_other.txt"):
            f = open(filename, "w")
            f.write("Some text\n")
            f.close()
            self.assertTrue(f.closed)

    def test_2(self):
        "Verify that the current directory is empty"
        self.assertEqual(glob.glob("*"), [], "Directory not empty")

    def teardown(self):
        os.chdir(self.origdir)
        shutil.rmtree(self.dirname)
        print("Deleted", self.dirname)

if __name__ == "__main__":
    unittest.main()


