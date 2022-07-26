#!/bin/python3
import sys
import time
import json

# read multipass instance list from stdin

multipass = json.loads(sys.stdin.read())

# create a dict mapping instance hostname to its first ip address

instance_dict = dict()

for instance in multipass["list"]:
  if instance["state"] != "Running":
    continue
  instance_name = instance["name"]
  instance_ipv4 = instance["ipv4"][0]
  instance_dict[instance_name+".local"] = instance_ipv4


new_hosts = []

# loop through hosts file and fill the above two variables
with open('/etc/hosts') as fp:
  line = fp.readline()
  is_in_block = False
  
  while line:
    if line == "# MULTIPASS BLOCK START #\n":
      is_in_block = True
      
    elif line == "# MULTIPASS BLOCK END   #\n" and is_in_block:
      is_in_block = False
      
    elif line == "# MULTIPASS BLOCK END   #\n" and not is_in_block:
      print("Fatal error: encounter a ending marker without a start marker")
      exit(2)
      
    elif line != "# MULTIPASS BLOCK START #\n" and is_in_block:
      # we are in our old blocks. do nothing :)
      time.sleep(0.001)
      
      
    else:
      # not in our block, and not in our marker lines.
      new_hosts.append(line)
      
    line = fp.readline()
  
  if is_in_block:
    print("Fatal error: Ending block marks not found. ")
    exit(1)

new_hosts.append("# MULTIPASS BLOCK START #\n")
for hostname in instance_dict.keys():
  new_hosts.append(f"{instance_dict[hostname]}\t{hostname}\n")
new_hosts.append("# MULTIPASS BLOCK END   #\n")

with open('/etc/hosts', 'w') as fp:
  fp.writelines(new_hosts)
