from fabric.api import *
from fabric.decorators import hosts

import shell

env.hosts = [
    'host1.domain.com',
    'host2.domain.com'
]

@hosts('')
def cmd():
    shell.shell()
