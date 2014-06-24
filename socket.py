from socket import *
sock=socket(AF_UNIX,SOCK_STREAM)
sock.bind("/var/ossec/queue/ossec/queue")


confirmed running
[root@ossec-client3 etc]# ps aux |grep ossec
root      1253  0.0  0.0  15588   500 ?        S    16:52   0:00 /var/ossec/bin/ossec-execd
ossec     1460  0.0  0.1   6524   700 ?        S    17:16   0:00 /var/ossec/bin/ossec-agentd
root      1463  0.0  0.0   4316   376 ?        S    17:16   0:00 /var/ossec/bin/ossec-logcollector
root      1467  0.0  0.0   4480   372 ?        S    17:16   0:00 /var/ossec/bin/ossec-syscheckd
root      1483  0.0  0.1 110284   840 pts/0    S+   17:17   0:00 grep ossec


you should also get an email



yum install  libinotifytool*
yum install gclibc*
yum localinstall inotify-tools-3.14-6.1.i686.rpm 
yum localinstall libinotifytools0-3.14-6.1.i686.rpm inotify-tools-3.14-6.1.i686.rpm
yum localinstall ossec-hids-2.7.1-37.el6.art.x86_64.rpm ossec-hids-client-2.7.1-37.el6.art.x86_64.rpm 

[ec2-user@ossec ~]$ sudo  /var/ossec/bin/manage_agents 


****************************************
* OSSEC HIDS v2.7.1 Agent manager.     *
* The following options are available: *
****************************************
   (A)dd an agent (A).
   (E)xtract key for an agent (E).
   (L)ist already added agents (L).
   (R)emove an agent (R).
   (Q)uit.
Choose your action: A,E,L,R or Q: A

- Adding a new agent (use '\q' to return to the main menu).
  Please provide the following:
   * A name for the new agent: ossec-client3
   * The IP Address of the new agent: 172.30.208.149
   * An ID for the new agent[006]: 
Agent information:
   ID:006
   Name:ossec-client3
   IP Address:172.30.208.149

Confirm adding it?(y/n): y
Agent added.

Agent key information for '006' is: 
MDA2IG9zc2VjLWNsaWVudDMgMTcyLjMwLjIwOC4xNDkgNDhlOTdiMmU1ZDFjN2ZlMWMxZGIyZmU4OGE1NzY3ODdiMDdjZGNkOGJhNjQ1ODA0Njc2ZDdjNDkzNjQzYmU4NA==

# entry
#sequence client-name ip key
006 ossec-client3 172.30.208.149 MDA2IG9zc2VjLWNsaWVudDMgMTcyLjMwLjIwOC4xNDkgNDhlOTdiMmU1ZDFjN2ZlMWMxZGIyZmU4OGE1NzY3ODdiMDdjZGNkOGJhNjQ1ODA0Njc2ZDdjNDkzNjQzYmU4NA==

/var/ossec/etc/client.keys




[ec2-user@ossec-client3 ~]$ rpm -qa |grep ossec
ossec-hids-2.7.1-37.el6.art.x86_64
ossec-hids-client-2.7.1-37.el6.art.x86_64



root@ossec-client3 etc]# /etc/init.d/ossec-hids start
Starting ossec-hids: 2014/03/31 17:16:25 ossec-logcollector(1103): ERROR: Unable to open file '/queue/ossec/.agent_info'.
2014/03/31 17:16:25 ossec-config(1756): ERROR: Duplicated directory given: '/etc'.
2014/03/31 17:16:25 ossec-config(1756): ERROR: Duplicated directory given: '/bin'.

