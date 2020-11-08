import os,json
from utz import utz,ddict
grp="pgmabv88"
srv="pgmabv88"


cmd="az sql server firewall-rule listzz -g {grp} -s {srv}  ".format(grp=grp,srv=srv)
stream = os.popen(cmd)
buf = stream.read()
# print(buf)
wall_list=json.loads(buf)
for wall in wall_list:
    print("name", wall["name"])
    print("startIpAddress", ddict(wall).startIpAddress)


