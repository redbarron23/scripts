#!/usr/bin/env python
import subprocess,re,os
# mail doesn't work on tuna ugh!
#command_line = '/bin/mail -s "Clam Finished" "jhourihane@taos.com"'
#process = subprocess.Popen(command_line, shell=True)


def process_exists(proc_name):
    ps = subprocess.Popen("ps ax -o pid= -o args= ", shell=True, stdout=subprocess.PIPE)
    ps_pid = ps.pid
    output = ps.stdout.read()
    ps.stdout.close()
    ps.wait()

    for line in output.split("\n"):
        res = re.findall("(\d+) (.*)", line)
        if res:
            pid = int(res[0][0])
            if proc_name in res[0][1] and pid != os.getpid() and pid != ps_pid:
                print("process is still running!")
                return True
    #print(process)
    return False



if __name__ == "__main__":
    print(process_exists("clamscan"))
    #print(process_exists("mussels"))
