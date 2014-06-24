#!/usr/bin/env ruby
file = 'iplog_mwu.txt'
s = File.stat("iplog_mwu.txt")
perm = sprintf("%o", s.mode)
perm.to_s
perm = (perm.to_s[3..-1])
expected_perm = '644'
unless perm == expected_perm
    File.chmod(0644, file)
end
