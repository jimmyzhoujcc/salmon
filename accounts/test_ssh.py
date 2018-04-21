import paramiko
import os
server='10.6.97.217'
ssh=paramiko.SSHClient()
#print 'load host keys----------->'
#ssh.load_host_keys(os.path.expanduser(os.path.join("~", ".ssh", "known_hosts")))
print 'ready to connect server----------->'
#ssh.connect(server, username=user, password=passwd)
ssh.connect(server)
stdin,stdout,stderr=ssh.exec_command('hostname')
print stdout.readlines()
sftp = ssh.open_sftp()
sftp.put('/tmp/yum.log', '/tmp/yum1.log')
sftp.close()
ssh.close()
print 'copy finished'
