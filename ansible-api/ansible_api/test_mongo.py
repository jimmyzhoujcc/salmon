from pymongo import MongoClient
def InsertDB(values):
    uri = 'mongodb://localhost'
    client = MongoClient(uri)
    db = client.test
    print ('values',values)
    db.col.insert(values)

data={"detail": {"node1": [{"changed": 'true', "stdout": "eth0      Link encap:Ethernet  HWaddr 08:00:27:23:41:8D  \n          inet addr:192.168.109.175  Bcast:192.168.111.255  Mask:255.255.252.0\n          inet6 addr: fe80::a00:27ff:fe23:418d/64 Scope:Link\n          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1\n          RX packets:132381 errors:0 dropped:0 overruns:0 frame:0\n          TX packets:74189 errors:0 dropped:0 overruns:0 carrier:0\n          collisions:0 txqueuelen:1000 \n          RX bytes:63035277 (60.1 MiB)  TX bytes:10802411 (10.3 MiB)", "cmd": "ifconfig eth0", "host": "node1", "task_name": "command", "rc": 0}], "node5": [{"cmd": "ifconfig eth0", "task_name": "command", "changed": 'true', "failed": 'true', "host": "node5", "stderr": "eth0: error fetching interface information: Device not found", "rc": 1}]}, "rc": 2}

InsertDB(data)
