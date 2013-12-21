#!/usr/bin/perl
# 
# # import module
use String::MkPasswdqw(mkpasswd);
#  
print custom password
print mkpasswd(-length => 13, -minnum => 4, -minlower => 4, -minupper => 2, -minspecial => 3);
