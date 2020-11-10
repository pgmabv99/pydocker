# build azure
#  aks cluster
#  sql server

import os,json

from utz import utz,ddict,uos

class azinit:
    def __init__(self):
        utz.enter()
    def sqlsrv_build(self):
        utz.enter()
        uos1=uos()

        grp="pgmabv88"
        srv="pgmabv88"
        fwl="pgmabv88"
        reg="eastus2"
        db="db88"

        cmd="az sql server delete   -g {grp} -n {srv}   --yes ".format(grp=grp,srv=srv)
        resp=uos1.uoscall(cmd)
        utz.sleep(20,"wait for delete to propagate")
        cmd="az sql server create -l {reg} -g {grp} -n {srv} -u srvadmin -p Mark8484 -e true ".format(reg=reg,grp=grp,srv=srv)
        resp=uos1.uoscall(cmd)
        if resp[uos.RC] !=0 :
            print("exiting")
            return

        respj=json.loads(resp[uos.BUFOUT])
        utz.pprint(respj)


        cmd="az sql server firewall-rule create -g {grp} -s {srv}  -n {fwl} \
                    --start-ip-address 0.0.0.0 --end-ip-address 0.0.0.0 ".format(fwl=fwl,grp=grp,srv=srv)
        resp=uos1.uoscall(cmd)
        if resp[uos.RC] !=0 :
            print("exiting")
            return
        respj=json.loads(resp[uos.BUFOUT])
        utz.pprint(respj)

        cmd="az sql db create -g {grp} -s {srv} -n {db}  ".format(db=db,grp=grp,srv=srv)
        resp=uos1.uoscall(cmd)
        if resp[uos.RC] !=0 :
            print("exiting")
            return
        respj=json.loads(resp[uos.BUFOUT])
        utz.pprint(respj)

        return


    def aks_build(self):
        utz.enter()
        uos1=uos()

        grp="pgmabv88"
        cls="pgmabv88"
        ipname="pgmabv88"


        cmd="az aks delete   --name {cls} --resource-group {grp} --yes"\
                            .format(cls=cls,grp=grp)
        resp=uos1.uoscall(cmd)
            
        cmd="az aks create   --name {cls} --resource-group {grp} \
                            --ssh-key-value /home/azureuser/.ssh/authorized_keys \
                            --node-count 1"\
                            .format(cls=cls,grp=grp)
        resp=uos1.uoscall(cmd)
        if resp[uos.RC] !=0 :
            print("exiting")
            return
        respj=json.loads(resp[uos.BUFOUT])
        utz.pprint(respj)
        clientid=respj["servicePrincipalProfile"]["clientId"]
            
        cmd="az role assignment create \
            --assignee {clientid} \
            --role \"Network Contributor\" \
            --scope /subscriptions/cbff8ae6-7d79-4b2d-bf97-d9fc382bc181/resourceGroups/{grp}"\
                            .format(clientid=clientid,cls=cls,grp=grp)
        resp=uos1.uoscall(cmd)
        if resp[uos.RC] !=0 :
            print("exiting")
            return
        respj=json.loads(resp[uos.BUFOUT])
        utz.pprint(respj)

        cmd="az aks get-credentials --resource-group {grp} --name {cls} \
                                    --overwrite-existing"\
                            .format(cls=cls,grp=grp)
        resp=uos1.uoscall(cmd)
        if resp[uos.RC] !=0 :
            print("exiting")
            return
        utz.pprint(resp[uos.BUFOUT])


        cmd="az network public-ip delete \
            --resource-group {grp}\
            --name {ipname}"\
                            .format(ipname=ipname,grp=grp)
        resp=uos1.uoscall(cmd)


        cmd="az network public-ip create \
            --resource-group {grp}\
            --name {ipname} \
            --sku Standard \
            --allocation-method static"\
                            .format(ipname=ipname,grp=grp)
        resp=uos1.uoscall(cmd)
        if resp[uos.RC] !=0 :
            print("exiting")
            return
        respj=json.loads(resp[uos.BUFOUT])
        utz.pprint(respj)
        ip=respj["publicIp"]["ipAddress"]
        utz.pprint(ip)
        #https://docs.microsoft.com/en-us/azure/aks/static-ip




azinit1=azinit()
azinit1.aks_build()
# azinit1.sqlsrv_build()






