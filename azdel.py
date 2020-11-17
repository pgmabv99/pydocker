
from utz import utz,ddict,uos

grp="pgmabv88"
srv="pgmabv88"
cls="pgmabv88"

utz.logset()
uos1=uos()

utz.print("start deletion",99)

cmd="az sql server delete   -g {grp} -n {srv}   --yes ".format(grp=grp,srv=srv)
resp=uos1.uoscall(cmd)

cmd="az aks delete   --name {cls} --resource-group {grp} --yes"\
                    .format(cls=cls,grp=grp)
resp=uos1.uoscall(cmd)

cmd="sudo shutdown"
resp=uos1.uoscall(cmd)






