############################;
#from fabric.api import env
#from fabric.api import run
#import logging ; logging.basicConfig(level=logging.DEBUG)
############################;
from fabric.api import *
env.user = "deploy"
env.key_filename = ["~/.ssh/badgeville"]
from fabric.colors import red, green
#env.shell = "/bin/sh -c"
#env.hosts=["ec2-50-16-134-66.compute-1.amazonaws.com", "ec2-23-23-43-64.compute-1.amazonaws.com", "ec2-174-129-123-70.compute-1.amazonaws.com"]
env.timeout=30
#env.parallel=True
# --skip-bad-hosts

"""
==================
simple primitives
==================
run(),sudo(),get(),put(),local(),prompt(),reboot()
"""

####################
# Server Roles
####################
env.roledefs = {

####################
# shards
####################

      'shards' : [
                  '205.166.181.5',
                  '205.166.181.6',
                  '205.166.181.7',
                  '205.166.181.8',
                  '205.166.181.9',
                  '205.166.181.10',
                  '205.166.181.14',
                  '205.166.181.11',
                  '205.166.181.12',
                  '205.166.181.13',
                  '205.166.181.15',
                  '205.166.181.16',
                  '205.166.181.17',
                  '205.166.181.18',
                  '205.166.181.19',
                  '205.166.181.20',
                  '205.166.181.21',
                  '205.166.181.22',
                  '205.166.181.23',
                  ],

      'qa_shard1' : [
                     'ec2-184-73-16-13.compute-1.amazonaws.com',
                     'ec2-50-19-200-106.compute-1.amazonaws.com',
                     'ec2-107-20-89-237.compute-1.amazonaws.com',
                     'ec2-107-20-93-220.compute-1.amazonaws.com',
                     'ec2-50-16-114-155.compute-1.amazonaws.com',
                     'ec2-174-129-188-183.compute-1.amazonaws.com',
                     ],





####################
# app_servers
####################
     'app_servers' : [
                      'ec2-23-22-86-242.compute-1.amazonaws.com',
                      'ec2-23-20-18-247.compute-1.amazonaws.com',
                      'ec2-107-22-127-120.compute-1.amazonaws.com',
                      'ec2-23-22-93-57.compute-1.amazonaws.com',
                      'ec2-50-19-156-163.compute-1.amazonaws.com',
                      'ec2-23-22-184-87.compute-1.amazonaws.com',
                      'ec2-107-21-152-233.compute-1.amazonaws.com',
                      'ec2-184-72-187-103.compute-1.amazonaws.com',
                      'ec2-50-19-69-94.compute-1.amazonaws.com',
                      'ec2-23-23-2-147.compute-1.amazonaws.com',
                      'ec2-50-19-27-238.compute-1.amazonaws.com',
                      'ec2-50-16-23-111.compute-1.amazonaws.com',
                      'ec2-107-21-151-134.compute-1.amazonaws.com',
                      'ec2-50-16-89-201.compute-1.amazonaws.com',
                      'ec2-23-20-119-24.compute-1.amazonaws.com',
                      'ec2-174-129-178-161.compute-1.amazonaws.com',
                      'ec2-23-22-25-48.compute-1.amazonaws.com',
                      'ec2-204-236-193-209.compute-1.amazonaws.com',
                      'ec2-54-234-157-199.compute-1.amazonaws.com',
                      'ec2-23-22-248-4.compute-1.amazonaws.com',
                      'ec2-174-129-83-133.compute-1.amazonaws.com',
                      'ec2-54-235-46-124.compute-1.amazonaws.com',
                      'ec2-72-44-43-92.compute-1.amazonaws.com',
                      'ec2-50-16-184-77.compute-1.amazonaws.com'

                      ],

####################
# front_end nginx?
####################
     'frontend_prod' : [
                         'ec2-23-22-248-4.compute-1.amazonaws.com',
                         'ec2-54-234-157-199.compute-1.amazonaws.com',
                         'ec2-204-236-193-209.compute-1.amazonaws.com',
                         'ec2-54-234-157-199.compute-1.amazonaws.com',
                         'ec2-204-236-193-209.compute-1.amazonaws.com',
                         'ec2-23-22-25-48.compute-1.amazonaws.com',
                         'ec2-174-129-178-161.compute-1.amazonaws.com',
                         'ec2-23-20-119-24.compute-1.amazonaws.com',
                         'ec2-50-16-89-201.compute-1.amazonaws.com',
                         'ec2-107-21-151-134.compute-1.amazonaws.com',
                         'ec2-50-16-23-111.compute-1.amazonaws.com',
                         'ec2-50-19-27-238.compute-1.amazonaws.com',
                         'ec2-23-23-2-147.compute-1.amazonaws.com',
                         'ec2-50-19-69-94.compute-1.amazonaws.com',
                         'ec2-184-72-187-103.compute-1.amazonaws.com',
                         'ec2-107-21-152-233.compute-1.amazonaws.com',
                         'ec2-23-22-184-87.compute-1.amazonaws.com',
                         'ec2-50-19-156-163.compute-1.amazonaws.com',
                         'ec2-23-22-93-57.compute-1.amazonaws.com',
                         'ec2-107-22-127-120.compute-1.amazonaws.com',
                         'ec2-23-22-143-81.compute-1.amazonaws.com',
                         'ec2-23-20-18-247.compute-1.amazonaws.com',
                         'ec2-23-22-86-242.compute-1.amazonaws.com'
                       ],

####################
#resque
####################
     'resque' : [
                  'ec2-50-19-1-59.compute-1.amazonaws.com',
                  'ec2-184-72-142-215.compute-1.amazonaws.com',
                  'ec2-50-19-24-45.compute-1.amazonaws.com',
                  'ec2-107-22-84-47.compute-1.amazonaws.com',
                  'ec2-107-21-185-137.compute-1.amazonaws.com',
                  'ec2-23-20-4-183.compute-1.amazonaws.com',
                  'ec2-107-22-9-67.compute-1.amazonaws.com',
                  'ec2-50-16-127-52.compute-1.amazonaws.com',
                  'ec2-50-17-154-160.compute-1.amazonaws.com',
                  'ec2-107-22-89-166.compute-1.amazonaws.com',
                  'ec2-23-22-183-82.compute-1.amazonaws.com',
                  'ec2-23-23-5-10.compute-1.amazonaws.com',
                  'ec2-23-22-159-125.compute-1.amazonaws.com',
                  'ec2-184-73-73-83.compute-1.amazonaws.com',
                  'ec2-75-101-184-212.compute-1.amazonaws.com',
                  'ec2-50-16-58-195.compute-1.amazonaws.com',
                  'ec2-107-20-118-60.compute-1.amazonaws.com'
                ],


####################
# timalytics
####################
     'timalytics' : ['jhourihane@208.65.181.230'],

####################
# nadge
####################
     'nadge' : ['ec2-user@nadge.bad.ge:2222']

####################
 #QA Servers
####################

####################
#SandBox
####################

} # ends env.roledefs

class FabricSupport:
    def __init__ (self):
        pass

    def run(self, host, port, command):
        env.host_string = "%s:%s" % (host, port)
        run(command)

myfab = FabricSupport()
# i.e.
#myfab.run('example.com', 22, 'uname')
#myfab.run('ec2-54-234-105-174.compute-1.amazonaws.com', 22, 'uname')

def help():
	#print (red("Usage: fab [options] <command>[:arg1,arg2=val2,host=foo,hosts='h1;h2',...] ..."))
	print ("Usage: fab [options] <command>[:arg1,arg2=val2,host=foo,hosts='h1;h2',...] ...")
	print "       i.e. fab -H kafka1,kafka2 multi_cmd"

def host_type():
    run('uname -s')

def history():
    run('history')

def curl():
    run("curl --version")

def sa():
   sar -u -f /var/log/sa/sa03


def anonymous():
    run('uname -n')
    run('uptime')
    run('screen')
    #disk_usage = run("df -h")
    run("df -h")


#def uptime():
#    run('uptime')

def w_timeouts():
    #local("screen")
    env.hosts = ["cron_1"]
    run('bundle exec rails c')

def host_name():
	env.user = "ec2-user"
	env.key_filename = ["~/.ssh/badgeville-east.pem"]
    	run('uname -n')


def resque_ps():
	run('ps afxo command,etime |grep resque |grep -v grep')

def multi_cmd():
	env.user = "ec2-user"
	env.key_filename = ["~/.ssh/badgeville-east.pem"]
	run('uname -a && hostname && pwd')

def mongo_hunter():
    run('mongohunter --seconds=30')

def sandbox_check():
	env.user = "deploy"
	env.key_filename = ["~/.ssh/badgeville"]
	env.hosts=["ec2-50-16-134-66.compute-1.amazonaws.com", "ec2-23-23-43-64.compute-1.amazonaws.com", "ec2-174-129-123-70.compute-1.amazonaws.com"]
 	run('uname -n')

def process_check():
	env.user = "deploy"
	env.key_filename = ["~/.ssh/badgeville"]
	#env.hosts=["10.10.10.10", "webserver.local"]
 	run('ps aux')

my_hosts = ('ec2-50-16-134-66.compute-1.amazonaws.com', 'ec2-23-23-43-64.compute-1.amazonaws.com', 'ec2-174-129-123-70.compute-1.amazonaws.com')
@hosts(my_hosts)
def collectd_check():
	env.user = "deploy"
	env.key_filename = ["~/.ssh/badgeville"]
 	run('ps aux |grep collect |grep -v grep')

#my_hosts = ('ec2-50-16-134-66.compute-1.amazonaws.com', 'ec2-23-23-43-64.compute-1.amazonaws.com', 'ec2-174-129-123-70.compute-1.amazonaws.com')
#@hosts(my_hosts)
def tar_untar_scripts():
	local('tar czf /tmp/scripts.tgz scripts/')
	put('/tmp/scripts.tgz', '/tmp/scripts')
	with cd('/tmp/'):
		run('tar xzf /tmp/scripts.tgz')


my_frontend_prod = ('ec2-23-22-248-4.compute-1.amazonaws.com', 'ec2-54-234-157-199.compute-1.amazonaws.com', 'ec2-204-236-193-209.compute-1.amazonaws.com',
                    'ec2-54-234-157-199.compute-1.amazonaws.com', 'ec2-204-236-193-209.compute-1.amazonaws.com', 'ec2-23-22-25-48.compute-1.amazonaws.com',
                    'ec2-174-129-178-161.compute-1.amazonaws.com', 'ec2-23-20-119-24.compute-1.amazonaws.com', 'ec2-50-16-89-201.compute-1.amazonaws.com',
                    'ec2-107-21-151-134.compute-1.amazonaws.com', 'ec2-50-16-23-111.compute-1.amazonaws.com', 'ec2-50-19-27-238.compute-1.amazonaws.com',
                    'ec2-23-23-2-147.compute-1.amazonaws.com', 'ec2-50-19-69-94.compute-1.amazonaws.com', 'ec2-184-72-187-103.compute-1.amazonaws.com',
                    'ec2-107-21-152-233.compute-1.amazonaws.com', 'ec2-23-22-184-87.compute-1.amazonaws.com', 'ec2-50-19-156-163.compute-1.amazonaws.com',
                    'ec2-23-22-93-57.compute-1.amazonaws.com', 'ec2-107-22-127-120.compute-1.amazonaws.com', 'ec2-23-22-143-81.compute-1.amazonaws.com',
                    'ec2-23-20-18-247.compute-1.amazonaws.com', 'ec2-23-22-86-242.compute-1.amazonaws.com')

@hosts(my_frontend_prod)
def check_release_dir():
	env.user = "deploy"
	env.key_filename = ["~/.ssh/badgeville"]
 	run('ls /data/badgeville/releases/20130402213340')



my_dc_hosts = ('205.166.181.4', '205.166.181.5', '205.166.181.6',
    '205.166.181.7', '205.166.181.8', '205.166.181.9',
    '205.166.181.10', '205.166.181.11', '205.166.181.12',
    '205.166.181.13', '205.166.181.14', '205.166.181.15',
    '205.166.181.16', '205.166.181.17', '205.166.181.18',
    '205.166.181.19', '205.166.181.20', '205.166.181.21',
    '205.166.181.22', '205.166.181.23', '205.166.181.24',
    '205.166.181.25', '205.166.181.26', '205.166.181.27',
    '205.166.181.28', '205.166.181.29', '205.166.181.30',
    '205.166.181.31', '205.166.181.32', '205.166.181.33',
    '205.166.181.34', '205.166.181.35', '205.166.181.37',
    '205.166.181.38')

@hosts(my_dc_hosts)
def check_dc_nodes():
 	run('/bin/uptime')
def putScript():
    #fileName = '/Users/jhourihane/check_system'
    #dirName = '/tmp'
    #put(fileName, dirName)
    #run("sudo /bin/cp /tmp/check_system /usr/local/bin")
    #run("sudo chmod 755 /usr/local/bin/check_system")
    #run('/bin/ls -l /usr/local/bin/check_system')
    #run('/usr/local/bin/check_system')
    # other examples
    #put('bin/project.zip', '/tmp/project.zip')
    put('scripts/*.rb', '/tmp/')
    #put('index.html', 'index.html', mode=0755)



#my_app_server_nodes = ('ec2-50-16-184-77.compute-1.amazonaws.com', 'ec2-23-22-86-242.compute-1.amazonaws.com',
#'ec2-23-20-18-247.compute-1.amazonaws.com', 'ec2-23-22-143-81.compute-1.amazonaws.com', 'ec2-107-22-127-120.compute-1.amazonaws.com',
#'ec2-23-22-93-57.compute-1.amazonaws.com', 'ec2-50-19-156-163.compute-1.amazonaws.com', 'ec2-23-22-184-87.compute-1.amazonaws.com',
#'ec2-107-21-152-233.compute-1.amazonaws.com', 'ec2-184-72-187-103.compute-1.amazonaws.com', 'ec2-50-19-69-94.compute-1.amazonaws.com',
#'ec2-23-23-2-147.compute-1.amazonaws.com', 'ec2-50-19-27-238.compute-1.amazonaws.com', 'ec2-50-16-23-111.compute-1.amazonaws.com',
#'ec2-107-21-151-134.compute-1.amazonaws.com', 'ec2-50-16-89-201.compute-1.amazonaws.com', 'ec2-23-20-119-24.compute-1.amazonaws.com',
#'ec2-174-129-178-161.compute-1.amazonaws.com', 'ec2-23-22-25-48.compute-1.amazonaws.com', 'ec2-204-236-193-209.compute-1.amazonaws.com',
#'ec2-54-234-157-199.compute-1.amazonaws.com', 'ec2-23-22-248-4.compute-1.amazonaws.com', 'ec2-23-22-131-224.compute-1.amazonaws.com',
#'ec2-174-129-83-133.compute-1.amazonaws.com')


#@hosts(my_app_server_nodes)
#def putScript():
#    fileName = '/Users/jhourihane/check_system'
#    dirName = '/tmp'
#    put(fileName, dirName)
#    run("sudo /bin/cp /tmp/check_system /usr/local/bin")
#    run("sudo chmod 755 /usr/local/bin/check_system")
#    run('/bin/ls -l /usr/local/bin/check_system')
#    run('/usr/local/bin/check_system')


#timalytics = '208.65.181.230'
# Assigning a host with a non standard port
@hosts('208.65.181.230:2222')
def getFile():
    env.parallel=False
    env.user = "jhourihane"
    env.key_filename = ["~/.ssh/badgeville"]
    #host='208.65.181.230-2222'
    #env.hosts = ['208.65.181.230:2222']
    fileName = '/tmp/ivillage_reward_definitions.csv.gz'
    get(fileName, '%(path)s')

    # other examples
    #get('*.csv', 'cgi-bin/')
    #put('index.html', 'index.html', mode=0755)


# append to remote file
# fabric.contrib.files.append(filename, text, use_sudo=False, partial=False, escape=True)

def append_ssh_key():
    env.parallel=False
    env.user = "jhourihane"
    env.key_filename = ["~/.ssh/badgeville"]
    fileName = '/tmp/ivillage_reward_definitions.csv.gz'

# comment out remote file
# fabric.contrib.files.comment(filename, regex, use_sudo=False, char='#', backup='.bak

# substitute file sed style
# fabric.contrib.files.sed(filename, before, after, limit='', use_sudo=False, backup='.bak', flags='')


# good deploy strategy
#def deploy():
#      local("git archive --format=tar HEAD | gzip > $(site).tar.gz")
#      run("rm -rf $(root)$(site)")
#      put("$(site).tar.gz', '$(root)$(site).tar.gz")
#      run("cd $(root)$(site)")
#      run("tar zxf $(site).tar.gz")
#      restart()

#  def restart():
#      run('sh $(root)$(site)/restart.sh')


### some variables #######
#version = run("cat /proc/version")


#######################
# Mapping Roles to Tasks
#######################
@roles('app_servers')
def uptime():
   run('uptime')
