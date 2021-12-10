Load changes to bash_profile:  
	. ~/.bash_profile
	
On a new global shell to ensure vi works properly do this:
	[d30201s@OGSH(drs-vusaapp11) ~]$ touch .vimrc
	
Remote to server:	
	rosh -l root -n $server
	rrsh $server
 
Add to .bash_profile 
	alias rrsh="rosh -l root -n " 

Unzip a tar file:
	tar -xvzf community_images.tar.gz
	 tar -xvf nmonchart40.tar

kill specific processes:
	ps -ef | grep 'rhsmd' | grep -v grep | awk '{print $2}' | xargs -r kill -9
	
Ping using specific interface:
	ping -I eth1 hostname 
	
Check disk usage without considering mount points:
	du -x

Clear caches:
	sync; echo 3 > /proc/sys/vm/drop_caches
	
This will report the percentage of memory in use
	free | grep Mem | awk '{print $3/$2 * 100.0}'

This will report the percentage of memory that's free
	free | grep Mem | awk '{print $4/$2 * 100.0}'

If audit logs are not being generated:
	wil-varpwastst01 auditd: /var/log/audit/audit.log permissions should be 0600 or 0640

finds largest files, not just directories. 
	find . -type f -size +50000k -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'  

View 10 largest CPU users
	ps -eo pcpu,pid,user,args | sort -k1 -r | head -10
	ps -eo pmem,pid,user,args | sort -k1 -r | head -10 
	ps -eo rss,pid,user,args | sort -k1 -r | head -10 
	ps -eo vsz,pid,user,args | sort -k1 -r | head -10 
	
View largest memory usage
	ps aux --sort=-%mem | awk 'NR<=10{print $0}'
	
ps command to show detail:
	PS_FORMAT="ruser,pid,ppid,s,%cpu,rss,cmd" ps ax --sort=pid | more

	You can see on the second column the PID you are looking for, along with the real user ID (ruser, 1st column), the parent PID (ppid, 3rd column), the status (s, 4th), the % CPU usage (%cpu, 5th), the resident set size (rss, 6th) and the command line with arguments (cmd, 7th). In my opinion, for this very case, the process status (it's a single letter) and the percentage of used CPU are the key values, along with the command line.

Count the number of CPUs
	cat /proc/cpuinfo | grep processor | wc -l
	nproc
	
to force unmount of nfsShare:
	umount -f -l /share/name

install rpm:
	rpm -i file.rpm

upgrade rpm:
	rpm -U file.rpm

uninstall rpm
1`
Restart HPSA agent
	/etc/rc.d/init.d/opsware-agent restart
	New HPSA:  
		service opsware-agent restart
	/etc/init.d/opsware-sas restart
	
Restart cron:
	/etc/init.d/crond start
	/etc/init.d/crond stop
	
If restart doesn't work try Hardware/Software reset
	/opt/opsware/agent/pylibs/cog/bs_hardware;/opt/opsware/agent/pylibs/cog/bs_software
	
If that doesn't work, do the communication test to fix it in HPSA. 
	
Restart Centrify
	/usr/share/centrifydc/bin/centrifydc restart

LDAP Service:
	/etc/rc.d/init.d/ldap start

Check if ldap is running:
	ps -ef | grep slapd 

Check network ports availability on Netezza server:
	for i in `ifconfig -a | egrep "^e|^__" | awk '{print $1}'`; do echo $i $(grep -i ^hwa /e*/*/ne*rk-*/ifcfg-$i) $(ethtool $i | egrep "Sp|Li") $(dmidecode -t9 | grep -B7 $(ethtool -i $i | grep ^bus | cut -d : -f2,3) | grep Desig); done | column -t

vmware tools:
	vmware-config-tools.pl 
	/etc/vmware-tools/services.sh restart
restarted vmware tools service, ran vmware-config-tools.pl

clean yum cache:
	rm -rf /var/cache/yum/* 
	
Make NIC self test:
	ethtool -t eth0

Clean old kernel images
	zip files within a month old, remove files older than one month
	package-cleanup --oldkernel --count=2

Check to see if ESP agent is running:
	ps -ef | grep cybAgent|grep -v grep

Start ESP agent:
	/bbtscripts/startesp.sh

Stop ESP agent:
	/bbtscripts/stopesp.sh
	
manually start ESP:
	nohup /opt/ca/cybAgent &
	/opt/ca/cybAgent - v			(See version)
Restart nsr service:
	ps -ef | grep -i nsr
	service networker status
	service networker start
	nsrrpcinfo -p clt-vstpermdr01-priv


/etc/init.d/syslog start 
/etc/init.d/rsyslog start

Start Splunk
	/opt/splunkforwarder/bin/splunk restart


rpm -qa | grep -i lgto
for linux
lslpp -l | grep -i lgto 
for AIX
\\wil-netapp02\ITBackup\ClientInfo\Backup\ClientSoftware
from there 9.2.1.5

On AIX, stop it with:
	nsr_shutdown
and then 
	/etc/rc.nsr to start  

Delete files older than

find /path/to/files* -mtime +10 -exec rm {} \;

find ./* -mtime +5 -exec rm {} \;

find ./* -mtime +90 -exec rm {} \;

find ./* -mtime +180 -exec rm {} \;
find /path -mtime +180 -print | xargs /bin/rm

find . -type f -empty -delete

find ./* -type d -ctime +5 -exec rm -rf {} \;
	removes directories older than 5 days recursively - Tanium Downloads

Network Gateway:
	route -n 
	
	
Check ulimits:
Hard limits:
	ulimit -Hn
Soft Limits:
	ulimit -Sn 
For a specific user, dzdo su <username> then run the commands above to check that user's limits.

To see default system ulimits:
	cat /proc/1/limits

AIX:

find /path/to/files* -type f -mtime +15 -exec rm -f {}  \; 

Find open IP:
	for i in $(seq 1 254); do if ! ping -c 1 192.168.75.${i} &> /dev/null; then echo 192.168.75.${i}; fi; done 
	
Rsync the files from old server to current
	rsync -av 192.168.75.225:/dynatrace/* /dynatrace/


ITM restart

AIX: /opt/itmtivoli/bin/itmcmd agent stop ux
        /opt/itmtivoli/bin/itmcmd agent start ux 

LINUX:  
			/opt/itmtivoli/bin/itmcmd agent stop lz 
           /opt/itmtivoli/bin/itmcmd agent start lz 

/opt/itmtivoli space issue:
			I’ve corrected the issue, the problem is someone or something is not configuring the ITM Agent correctly.  
			When this happens the agent runs, collects performance data and stores is locally but the larger issue is there is also no monitoring.
			The correct configuration should be the TEMS, “in this case, clt-pitmappdrs02” not both hostname and IP; “clt-pitmappdrs02: 10.130.40.58”.
			The history files are located in: /opt/itmtivoli/lx8266/lz/hist  “this is for Linux, the path for AIX is different”
			If you see this problem again you can delete everything in this directory, then stop and start the agent.
			It will re-create all the collection files.
			If the files are not huge the agent once connected will pull the data and take care of itself.
			The important thing is to have the proper configuration.
				/opt/itmtivoli/bin/cinfo -c lz | grep -i IPV4
				/opt/itmtivoli/bin/itmcmd config -A agent lz
				\rm /opt/itmtivoli/lx8266/lz/hist/*
				/opt/itmtivoli/bin/itmcmd agent stop lz
				/opt/itmtivoli/bin/itmcmd agent start lz
TEMS Agent:
	
· TEST – 			wil-pitmapptst02	: 192.168.229.210 
· PROD DB – 		prd-pemstemr2	: 10.128.41.99 (Production DB servers hosting DB2, Oracle, Progress, etc.) 
· PROD NON-DB – 	wil-emstemr01	: 10.128.40.100  (Production non-DB servers) 
· PROD DMZ OLD– 	wil-evitmpxy01	: 172.16.101.154 
· PROD DMZ NEW - 	wil-vitmpxypis01	: 172.24.224.202 
· TEST DMZ OLD – 	wil-evitmpxy02	: 172.16.99.175 
· TEST DMZ NEW - 	wil-vitmpxytis01	: 172.21.192.202 
. DR          - 	clt-pitmappdrs02	 : 10.130.129.191
ZDC Hall 2		- 	pif-vitmpxy02 		: 	172.28.224.17
192.168.229.210  dde-voimwls02  This 2X network uses this TEMS server. 
10.169.32.21	ENCLAVE -PROD         
	pe1-pitmpxy02 is 10.169.33.20
	pe1-pitmpxy01 is 10.169.32.21

To see if ITM is connected:
	[root@dde-vusasat03 ~](594) # netstat -a | grep -i can
	tcp        0      0 dde-vusasat03:18207     192.168.229.210:can-nds ESTABLISHED
	If not established, not connected. 
 
ITM:
		/opt/itmtivoli/bin/cinfo -r; ps -ef | grep -i itm| grep -v grep
		/opt/itmtivoli/bin/itmcmd agent start lz/ux
		/opt/itmtivoli/bin/cinfo -c lz
		; ps -ef | grep -i itm| grep -v grep
		/opt/itmtivoli/bin/itmcmd agent start lz/ux
		/opt/itmtivoli/bin/cinfo -c lz
		lz/ux
		/opt/itmtivoli/bin/cinfo -c lz

Install ITM on RHEL 6:
		mount wil-pnimrod:/unix_soft/ITM /mnt
		cd /mnt
		ls
		yum install itm-6.30.07-1.el6.x86_64.rpm
		/opt/itmtivoli/bin/cinfo –i
		/opt/itmtivoli/bin/itmcmd config -A lz
		/opt/itmtivoli/bin/itmcmd agent stop lz
		/opt/itmtivoli/bin/itmcmd agent start lz
		umount /mnt

Installer:
	wil-pitmapptst01:/tivoli/itm_63_rhel/lx8266.tar.gz
	
 
Check for read only file systems
	grep -w ro /proc/mounts | grep -v tmpfs
	
On AIX, stop it with nsr_shutdown and then 
	/etc/rc.nsr for start 
	
private interface is not reachable from wil-legtst01 serve. Could you please check and perform below steps 

Stop Networker services 
rename nsrladb(../nsr/res/) & tmp (../nsr/) folders 
Start Networker services 

Copy from servers
cp -R /$SERV/sourceservername/$ROT/path where files available  /$SERV/Destinationserver/$ROT/destination servers's path/

cp -pr $SERV/SOURCE SERVER/$ROT/SOURCE DIRECTORY $SERV/TARGET SERVER/$ROT/TARGET DIRECTORY



When scanning for new disks on file extensions:
	for i in `seq 0 32`; do echo "- - -" | sudo tee /sys/class/scsi_host/host$i/scan; ls /dev/sd* ; done 

Find where the most files are being used for inode issue:
	find /var -xdev -printf '%h\n' | sort | uniq -c | sort -k 1 -n
	
Check listening ports Linux:
	netstat -tulpn | grep LISTEN
	lsof -i :7938	(shows what is listening on the port specified)
	ss -anp | grep ':13125'
	
Get df -g output for multiple servers to a file:
	for i in `cat varhost.txt`; do echo "Servername :" $i; rosh -l root -n $i -t "df -g"; done | tee -a output.txt
	
---Server Acceptance----

curl https://artifactory.bbtnet.com/artifactory/list/iao/inspec/acceptance_attribute.sh | bash

 cat /etc/yum.repos.d/redhat.repo
	
Server Acceptance Copy UID/GID
	cp $SERV/wil-pnimrod/$ROT/unix_software/server_acceptance/ref_uid_file $SERV/pps-vachwas02/$ROT/var/bbt/server_acceptance/ref_uid_file
	cp $SERV/wil-pnimrod/$ROT/unix_software/server_acceptance/ref_gid_file $SERV/pps-vachwas02/$ROT/var/bbt/server_acceptance/ref_gid_file
	
Prod DMZ - bbtlobcc.local
Test DMZ - bbtdmztst.local
	/opt/OV/bin/nnmsnmpwalk.ovpl -v 1 -c T1Vsnmp lps-vcmptcs07.bbtdmztst.local 1.3.6.1.2.1.1
	/opt/OV/bin/nnmsnmpwalk.ovpl -v 2 -c T1Vsnmp -t 1000 -r 1 lps-vcmptcs07.bbtdmztst.local system
	
CLTPRD	drs-vnnmtls01
WILPRD	prd-vnnmtls01
WILTDC	dev-vnnmtls01 

	
Server Acceptance deploy web scripts:
	/home/c29954s/public/System_Restart_Scripts/deploy_web_scripts
	

                                             CHEF SERVER ACCEPTANCE
https://chef-compliance.bbtnet.com/e/BB&T/#/login

curl https://artifactory.bbtnet.com/artifactory/list/iao/inspec/acceptance_attribute.sh | bash

open excel  Delete rows C D E F I K

                              TEMS
        /opt/itmtivoli/bin/cinfo -c lz | grep "TEMS Host Name"
         
		 /opt/itmtivoli/bin/itmcmd config -A lz
  
TEMS Servers: Wilson  
* TEST – wil-pitmapptst02: 192.168.229.210  
* PROD DB – prd-pemstemr2: 10.128.41.99 (Production DB servers hosting DB2, Oracle, Progress, etc.)  
* PROD NON-DB – wil-emstemr01: 10.128.40.100  (Production non-DB servers)  
* PROD DMZ OLD– wil-evitmpxy01: 172.16.101.154  
* PROD DMZ NEW - wil-vitmpxypis01: 172.24.224.202  
* TEST DMZ OLD – wil-evitmpxy02: 172.16.99.175  
* TEST DMZ NEW - wil-vitmpxytis01: 172.21.192.202  
Charlotte  
* PROD - clt-emsrtemprd01: 10.130.40.50  
* DR - clt-pitmappdrs02: 10.130.40.58  
* DMZ/CST - clt-vemsitmpxy02: 172.25.224.203

subscription-manager identity

RHEL7 TEST subscription-manager register --name="$(hostname -f)" --org="BBT" --activationkey="test-rhel7" --force 

RHEL7 PROD subscription-manager register --name="$(hostname -f)" --org="BBT" --activationkey="prod-rhel7" --force 

RHEL6 PROD subscription-manager register --name="$(hostname -f)” --org="BBT" --activationkey="prod-rhel6" -–force  
 


Kill all with a pid:
	for pid in `ps -ef|grep remfile.sh|awk '{print $2}'`; do kill -9 $pid; done 

	always try the part that is in the command to make sure it returns a good value
		ps -ef|grep remfile.sh|awk '{print $2}' 
	
	
See the size of luns:
	multipath -v4 -ll
Example output:
	mpathi (3600014400000001060637b517ef3b0d5) dm-3 EMC,Invista
	size=10G features='1 queue_if_no_path' hwhandler='0' wp=rw
	`-+- policy='round-robin 0' prio=1 status=active
	  |- 1:0:1:0 sdd 8:48  active ready running
	  |- 3:0:0:0 sdf 8:80  active ready running
	  |- 1:0:0:0 sdb 8:16  active ready running
	  `- 3:0:1:0 sdh 8:112 active ready running

	

Find deleted file in running processes:
	lsof +L1
	
Retired server ITM ticket:
	These can all be assigned to ITSM-EMS-UNIX. I talked to Mark Jones about this previously for tickets we received on other servers. All other monitoring has been disabled, however Mark stated that  there is no way to disable the OS agent in ITM until the server is actually down. He advised to assign the tickets to his team. 

Netstat for listening ports	
	netstat -tuplen
	
Check for swappiness:
	cat /proc/sys/vm/swappiness
	
systemctl status iptables
systemctl status firewalld

Firewall team  ITSM-Ops-NetInfraSecuritySvcs  

rgreq -o unlock db2_db2ftmp1_db2ftmp1_FTMDBTCH-rg 
rgreq -o unlock db2_db2ftmp1_db2ftmp1_FTMDB-rg  


Infosec-DistSystems-Access-Administration handles access administration

Device Clock Slow/Fast:
	$ hwclock --show
	Sat Sep 4 19:29:43 2004 -0.006329 seconds
	$ date
	Sat Sep 4 19:26:21 EDT 2004

tdc-nas-01:/tdcnas01_nfs01/tibcoshrdev /data/nfsShare         nfs4    rw,user,exec,group,soft,intr,sec=sys,proto=tcp,port=2049 0 0
p2h-nas-02:/p2hnas02nfs01/tibcoshrprd /data/nfsShare nfs rw,user,exec,group,soft,intr,proto=tcp,port=2049 0 0

\\p1h-nas-01\PRDNASDM901\TitaniumFS     /opt/debtmanager                 cifs    gid=tibco,uid=tibcoap,rw,credentials=/root/.cred,sec=ntlmsspi 0 0
\\wil-netapp04\SPOVendorReportExcelFile\Apptio Upload\Production  /apptio-upload/production  cifs gid=staff,uid=numerify,rw,credentials=/root/.cred,sec=ntlmsspi 0 0

Restart Spectrum:
	ps -ef|grep spectrum|grep -v grep
	kill -9 PID's
	ps -ef|grep spectrum|grep -v grep

	su - svrmgtpb
	cd /opt/pb/PBSpectrum/server/bin/
	. ./setup
	./server.start

	cd /opt/pb/PBSpectrum/server/app/repository/logs/
	tail –f wrapper.log

	ps -ef|grep spectrum|wc –l              should be 5


Kill all process with "name"
	pkill -9 "name"

Show past reboots
	last reboot 

Find new HDDs
	for i in `seq 0 5`; do echo "- - -" | sudo tee /sys/class/scsi_host/host$i/scan; ls /dev/sd* ; done


Invalid file in /var/log/sa - move file to /tmp, restart sysstat:
	/etc/init.d/sysstat stop
	/etc/init.d/sysstat start

Connect Direct service start/stop
	/etc/rc.d/init.d/ndm start/stop
	
Splunk start/stop/status
	/etc/rc.d/init.d/splunk start/stop/status
	
See if server is being backed up with vproxy:
	go to tst-vlegtls05
	run:
		mminfo -k | grep -i server-name
		mminfo -k | grep -i dev-vtibadm03
		
TSA Cluster -
	rgreq -o unlock 'group'
	rgreq -o lock 'group'
	rgreq -o move 'group'
	resetrsrc -s 'Name like "%"' IBM.Application  (TSAMP Cheat Sheet link in Chrome)
	startrpdomain uatkbadb2cluster201  - starts the domain
	startrpnode uattvkbadb201  - starts the node 
	lsrpdomain - shows domain state
	lsrpnode - shows node state 

From Stephen: 
	if I want to see is a group of servers were patched...I would run "yum check-update |grep kernel" across all the servers or rpm -qa |grep kernel(version) 
	if yum check comes back with nothing then the server has been patched 
	the yum update(upgrade) clears to yum repolists of any pending packages. 
	
Requesting ASM LUN Increase example:  RITM1585958   and RITM1083931 & RITM1348182

When LG server and user cannot log in, check chage ID#

Add user:
	 useradd -m -u 24386 -g 100 -c "Amanullah, Arsalan – MGR = Tara Hardison" d75470	
	 passwd d78600 
	 chage d78600
		(chage -E -1 d30201 sets the account to never expire)
		(chage -M -1 d30201 sets the maxium days between password change to never)
		(chage -I -1 d30201 sets password inactive to never)
		(OR using - passwd -x -1 d30201 sets the password to never expire) 
	 Then change the expire date to a year away
	 visudo
	 d81562 ALL=NOPASSWD:/bin/su - oracle #TASK3043383
	 oDh20200520
	 
	 d75469:x:26380:100:Nukala, Rana - TASK2705827:/home/d75469:/bin/bash
	 
	 chage -l user		to see information
	 passwd --status user 	to see if account locked
	 userdel -r d30201s 	to remove a user and their home directory.  To just remove just the user and not their home directory, leave -r off.  
	 
pd3 is accessible from HPSA, ssh to other servers from there...
d30201 tp2 26944=UID 100=GID

#Legacy LG servers - October 2020
10.64.50.14     pd3.bbandt-lob.com
10.64.50.15     pd4.bbandt-lob.com
10.64.12.50		lnx1.regacc.com
10.140.12.15	lnx4.regacc.com 			
10.64.12.53     lnx5.regacc.com 
10.64.12.55     lnx7.regacc.com 
10.64.18.201    lnx9.regacc.com 
10.64.12.52     lnx13.regacc.com 
10.64.25.14     dwhapp01.bbandt-lob.com 
10.64.25.15     dwhapp02.bbandt-lob.com
10.64.6.88      esvcdcitm01 - domain does not show with hostname -f or -a 
10.64.25.35     clt-sodhoraprd01.bbandt-lob.com 
10.64.25.36     clt-sodhoraprd02.bbandt-lob.com 
10.64.24.31     clt-spptoraprd01.bbandt-lob.com
10.64.24.32     clt-spptoraprd02.bbandt-lob.com 
10.130.149.236  clt-vparappprd01 - domain does not show with hostname -f or -a


NFS:
Check the export permissions for the NFS file system. You can do this from the client:

	# showmount -e server_name

Example /etc/fstab entry:
	TDC-NAS-01:/tdcnas01_nfs01/dynatrace_logs-uat /dynatrace_logs nfs  rw,user,exec,group,soft,intr,proto=tcp,port=2049 0 0
	
	
extending ODHODH LUN

	RAC 2010 is the RAC Key for SSR project.

	RITM1751625 - Example

	RITM1585958 - Example 

	RITM1804042 - Example 
	  789  for i in `seq 0 60`; do echo "- - -" | sudo tee /sys/class/scsi_host/host$i/scan; ls /dev/sd* ; done
	  790  clear
	  791  fdisk -l
	  792  multipath -l
	  793  exit
ODH LUNS:	  
	HBA Model/Make	HBA Driver Version	Multipath SW	Other
	0x10000090fa402197
	Emulex Lightpulse
	11.0.1.6
	MPIO
	0x10000090fa29744e
	Emulex Lightpulse
	11.0.1.6
	MPIO
	0x10000090fa401c16
	Emulex Lightpulse
	11.0.1.6
	MPIO
	0x10000090fa29734a
	Emulex Lightpulse
	11.0.1.6
	MPIO

	  
	  
	  
NFS Share nobody owns
	domain is not set to bbtnetapp in /etc/idmapd.conf 
	Make a copy of the file, then change the Domain parameter to Domain = bbtnetapp
	service rpcidmapd restart
	unmount and remount the share
	change the ownership and verify
	
Mount Issues with NFS Share
		service rpcbind stop
		service nfslock stop
		service rpcidmapd restart

		cp /etc/fstab /etc/fstab-20200820-djw
		cp /etc/idmapd.conf /etc/idmapd.conf-20201008-djw
		vi /etc/fstab 
		vi /etc/idmapd.conf 

		umount -fl /PegaIndexes
		mount -a -vvv
		ls -la /PegaIndexes 
		
		
		[‎8/‎17/‎2020 12:59 PM]  Harrelson, Chad:  
		ok, it's working now
		When you can get lsof to return, trying asking it for the NFS port, like this
		lsof -t -i TCP:20048 
		That gave me the RPC process ID, which I killed.
		 
		[‎8/‎17/‎2020 1:01 PM]  Williams, Dana - LINUX:  
		[root@uat-vecrapp03 log]# lsof | grep /enigma/data
		lsof: WARNING: can't stat() nfs4 file system /enigma/data
			  Output information may be incomplete. 
		I couldn't get a process out of it to get a file on, how did you?
		 
		[‎8/‎17/‎2020 1:01 PM]  Harrelson, Chad:  
		Then I was able to do a force umount with -l
		 umount -fl /enigma/data 
		 
		This gave me the process ID
		lsof -t -i TCP:20048 

		[‎8/‎17/‎2020 1:03 PM]  Williams, Dana - LINUX:  
		is the port always 20048?
		cause in fstab, it says port 2049?
		 
		[‎8/‎17/‎2020 1:04 PM]  Harrelson, Chad:  
		2049 is for the NFS server.  20048 is for mountd (client side)
		Look in /etc/services
		 
		[‎8/‎17/‎2020 1:04 PM]  Williams, Dana - LINUX:  
		aha!
		 
		[‎8/‎17/‎2020 1:04 PM]  Harrelson, Chad:  
		mountd          20048/tcp               # NFS mount protocol
		mountd          20048/udp               # NFS mount protocol 
	
NTP Incidents:
		turn ntp on so it will sync. you can run a ntpstat to check if it has sync yet should say synchronized 
		also it should always be on....time drifts cause major issues with app performance. run a chkconfig --list ntpd
		if it is off then turn it on with chkconfig ntpd on
			cat /etc/ntp.conf 	(get server)
			ntpdate -u <server>
			date	confirm correct
 
Steve Salter's team does DNS/DHCP: 
	ITSM-Ops-InfrastructureSvcs or ITSM-DevEng-InfrastructureSvcs 
 
Nevelle Vinson is Charlotte Facility Coordinator
	Rick Miller is Zebulon/Wilson

Special Instructions:  FE must wear a face mask at all times and practice social distancing while in the facility.  The CTask number to gain access is X.  Please email any WebEx information to ITSM-Ops-Linux to ensure and engineer on shift gets it. For any issues please call our manager, Tom Bates at 984-833-9933.

File Corruption:
		The file you tried to install was corrupted 
		You can check it with the command "md5sum" 

Centrify Issue
	yum update --enablerepo=centrify -y CentrifyDC
	
	ok so you can run the same yum command and add "--downloadonly" at the end. this will download the new packages. 
		They should download to: /var/cache/yum/x86_64/7Server/centrify/packages/ 
	you can then run:
		rpm -Uvh /var/cache/yum/x86_64/7Server/centrify/packages/CentrifyDC*rpm --force
		
	If there is no centrify.repo file, create it and put the following in it:
			[centrify]
			name=Artifactory Yum Repository for Centrify
			baseurl=https://artifactory.bbtnet.com/artifactory/centrify-yum
			enabled=1
			fastestmirror_enabled=0
			gpgcheck=0
			skip_if_unavailable=1
			
ps -ef | grep 'rpm' | grep -v grep | awk '{print $2}' | xargs -r kill -9
yum localinstall --nogpgcheck --disablerepo=* *.rpm -y 

Yum Update Issues
	Yum check fails or 404 pycurl error:
		subscription-manager refresh && subscription-manager attach --auto && subscription-manager status 
		Register_Sat_6 Script
	
	Error with centrify repo
		yum -y upgrade --exclude=nfs* --disablerepo=centrify --nogpgcheck
	
	Error on gremlin repo:
		edit the file in /etc/yum.repos.d/ that has that repo on it, set enabled to 0  - then patch normally
		
	Error: requested datatype filelists not available 
		you have to edit /etc/yum.repos.d/centrify.repo and changed enabled=1 to enabled=0, save and exit, then it updates just fine.  You could also use the update line with --disablerepo=centrify to resolve it 
		 Sometimes it may not be the centrify repo, so just --disablerepo on each one until it works, then note which was causing it and raise appropriate flags if it is a RH repo 
		
Enclave Update:
Because these servers are live, I will provide the resolution but it has to be implemented by ITSM-Ops-Linux:

			1. rm -fr /var/cache/yum/*
			2. yum clean all
			3. subscription-manager register --name="$(hostname -f)" --org="BBT_HSD" --activationkey="prod-rhel7" --force
			4. enable the following repos using this command:
			subscription-manager repos --enable rhel-7-server-satellite-tools-6.7-rpms --enable rhel-7-server-ansible-2.8-rpms --enable rhel-7-server-rh-common-rpms --enable rhel-server-rhscl-7-rpms --enable rhel-7-server-rpms
			5. [root@re1-vunxbfx01 ~]# subscription-manager repos --list-enable
			6. yum update -y
 
YUM rpmdb errors:
			mkdir /tmp/rpmdb-backup/
			cp -avr /var/lib/rpm/* /tmp/rpmdb-backup/
		The try this to fix this problem:
			rm -f /var/lib/rpm/__db*
			rpm --rebuilddb
			yum clean all 
		I made the backup in /tmp/rpmdb-backup instead of in /root as it says
		
	If yum commands hang, look for the rpm lock files and remove them, then retry.
 
	dde/3x servers:	
		add this line to /etc/yum.repos.d/centrify.repo
		skip_if_unavailable=1 
		
	TDC Enclave:
		FYI – you will need to be sure and run the following before running any updates or checks in order to enable repos:
			subscription-manager repos --enable rhel-7-server-rpms --enable rhel-7-server-supplementary-rpms --enable rhel-7-server-optional-rpms --enable rhel-7-server-rh-common-rpms --enable rhel-server-rhscl-7-rpms
		If you don’t you won’t get any updates.  Disabling all of the repos seems to be systematic in the TDC Enclave.  If you happen to discover any more, please let me know.  Thanks!
		
		No Satellite repositories(repos) are enabled on the TDC Enclave Linux servers. Anyone implementing patching CRs has to run subscription-manager --enable=REPO_ID on all servers before they will update. Specifically:
 		subscription-manager repos --enable rhel-7-server-rpms --enable rhel-7-server-supplementary-rpms --enable rhel-7-server-extras-rpms --enable rhel-7-server-optional-rpms --enable rhel-7-server-rh-common-rpms --enable rhel-server-rhscl-7-rpms


1.	Check the facility in HPSA. 
2.	If TDC_DMZ_SA_DMZNetwork
a.	then export https_proxy=http://tdcdmz-cldprx.bbtnet.com:8080         
3.	if WIL_PRD_SA-DMZNetwork
a.	Then export https_proxy=http://zdc-h1-dmz-cldprx.bbtnet.com:8080
4.	If ZDC_PRD_SA-DMZH2Network
a.	Then export https_proxy=http://zdc-h2-dmz-cldprx.bbtnet.com:8080
5.	If CLT_PRD_SA_DMZNetwork
a.	Then export https_proxy=http://cltdmz-cldprx.bbtnet.com:8080


NFS Share nobody owns
	domain is not set to bbtnetapp in /etc/idmapd.conf 
	Make a copy of the file, then change the Domain parameter to Domain = bbtnetapp
	service rpcidmapd restart
	unmount and remount the share
	change the ownership and verify
 
Reinstall Networker
	Networker install file retrieved:
	\\wil-netapp02\itbackup\ClientInfo\Backup\ClientSoftware\18.2.0.1\nw18203_linux_x86_64.tar.gz


Emails in TDC:
	Hi Ravi/Team,
	SMTP relays has been migrated to new servers on 06/31/2018 by ITSM-OPS-MESSAGING team as required for the ZDC migration. 
	They have redirected mails from TDC to test exchange system to prevent email flooding on production and accidental email delivery to clients. 
	From now on, if you send emails within TDC (192.168.x.x) to ITSM-Ops-Database-DB2UDB@BBandT.com, emails will be delivered to the TDC mailbox https://twebmail.bbandt.com 
	If you send emails from production (10.x.x.x), emails will be delivered to the production mailbox. (Which you can access from your Outlook)
	Please let me know if there are any questions. Thanks. 
	                                                                                                        
	Regards,
	Saravanan G 
 
Network Control Help Desk at 866-567-4357	 NCHD

CyberArk no root password - ITSM-InfoSec-PAM open an incident

Any Truist employee should be able to receive technical support by calling IBM and providing the hSTI customer number :
		IBM Support 1–800–426–7378
		IBM Customer Number : 0720001

Example Hana Disk replacement:   - CHG0395077

/var/clientmqueue - Send to ops-web 

prd-sedlhdpd## /data# capacity incidents 
	Close with comment
	Per Pothireddi, Gopi, these disks are intended to be fully utilized and they cannot control the size of these fluctuating directories. Alerting will need to be modified. 
	
Clientmqueue files are for sendmail

IS-Tibco-DEV / IS-Tibco-PROD are the Tibco team's email dist. group names
ITSM-Ops-Middleware Tibco LOB?

Guardium Installer in /home/gdmuser - (James Randall install tasks)
	ps -aef | grep guard to see Guardium processes after install.
	
HPSA Install Issues:
				here is a command to run com test more easily :
			1386  26/08/20 13:33:49 , /opt/opsware/support/bin/dump_comm_test_results --help
			 1387  26/08/20 13:40:01 , /opt/opsware/support/bin/dump_comm_test_results -q 'spin.Device.getIDList(restrict={"state":"UNREACHABLE", "opsw_lifecycle":"MANAGED"})'
			 1388  26/08/20 14:24:23 , /opt/opsware/support/bin/dump_comm_test_results 8390102 
			 
			 RHEL 5 Yum issue clean up

			[‎9/‎2/‎2020 2:35 PM]  Ronchetti, John:  
			the 2nd one is in new SA and is working properly
			wil-vtcdevs02 
			1) uninstall agent with --force option
  
			2) the problem comes from the OS being "unknown" which has something to do with yum.
			so far both servers had an old yum lock from jun 19
				ps -ef | grep yum            to find it
				kill -9 <process number> from above
				mkdir /var/lib/rpm/backup
				cp -a /var/lib/rpm/__db* /var/lib/rpm/backup/
				rm -f /var/lib/rpm/__db.[0-9][0-9]*
				rpm --quiet -qa
				rpm --rebuilddb
				yum clean all 

			3)  agent install from gui should work now 

NPRD-vcenter01
	servers in there are not able to be accessed with hpsa or ssh, Rinc Burgmon said: Yes that is what we are using for the new Truist servers - I think you must have the VDI to access the new Truist servers.
	
Origenate Servers issues:
	ITSM-LOB-LG-OrigenateSupport@BBandT.com
	example, disk space issue on uat-vorgapp03 on /u01
	
/opt/arty_exports disk space issue:	
	INC16164575 shows resolved by Subbareddy Madireddy from the ITSM-ADS-ContinuousIntegration team
	
IBM Contact:
	Stan Shumate 
	9192197580 
	shumate@us.ibm.com 
	
Restart Dimensions:
	cd /opt/serena/dimensions/agent/cm/prog/
	./dmshutdown
	./dmstartup
	
X11 Forwarding
	1. Uncomment the following lines:

		X11Forwarding yes
		X11DisplayOffset 10
		X11UseLocalhost no
		2. Start and enable the sshd service

		# systemctl start sshd.service
		# systemctl enable sshd.service
		
Emergency Mode:
	Press 'e' when on the kernel selection screen.  On the line with linux16, before the rd.lvm section, put rw init=/sysroot/bin/sh and press CTRL X.
	Next chroot /sysroot and change the root password or do work on the file system.  Type exit twice to restart normally.

Stop Current vnic speed set to 0 messages:
	for current session you do:
	echo '3 4 1 7' > /proc/sys/kernel/printk
	to make it persist a reboot:
	add 
	kernel.printk = 3 4 1 7
	then run sysctl -p  
	
Access request for service accounts to servers using Centrify:
	https://bbitprod.service-now.com/nav_to.do?uri=%2Fcom.glideapp.servicecatalog_category_view.do%3Fv%3D1%26sysparm_parent%3Dfa1b6323104cd180f9befdcdfd1d48c2%26sysparm_no_checkout%3Dfalse%26sysparm_ck%3D8c2aa2211bf4e89081f4c8451a4bcb3c641bc2de5229cd304aeaa97bba530d4f92f0960e%26sysparm_catalog%3De0d08b13c3330100c8b837659bba8fb4%26sysparm_catalog_view%3Dcatalog_default
	
	
The Linux team works from Incidents, Tasks and Changes only.  Please use the link below to create an incident to the ITSM-Ops-Linux team and an available engineer will assist you.

https://bbitprod.service-now.com/nav_to.do?uri=%2Fincident.do%3Fsys_id%3D-1%26sysparm_query%3Dactive%3Dtrue%26sysparm_stack%3Dincident_list.do%3Fsysparm_query%3Dactive%3Dtrue


Please follow these steps to backup and rebuild the rpmdb database:

	mkdir /var/lib/rpm/backup
	cp -a /var/lib/rpm/__db* /var/lib/rpm/backup/
	rm -f /var/lib/rpm/__db.[0-9][0-9]*
	rpm --quiet -qa
	rpm --rebuilddb
	yum clean all
	
For CIFS share permission for a new service account to read/write the share
	RITM2183776 
	File Access – Drive Mapping 
	catalog 
	
HPSA:
	Dev HPSA, login with either dev-vusaapp10 or 11.

	UAT HPSA, login with either uat-vusaapp10 or 11.
	
IBM representative
	[‎12/‎27/‎2020 6:37 PM]  Bates, Tom:  
	(919) 219-7580 
	Stan Shumate
	Stan Shumate (shumate@us.ibm.com) 
	IBM	​800-426-7378

HANA Management console:
	tst-aunxhmc4b 
	that's it's HMC
	Then type vtmenu
	choose B (I think it's 2?)
	and then choose the server
	then you'll get a login

 
Group to configure ESP jobs:
	ITSM-Ops-PCON 

Contact for *vcolc* servers:
	Richard Ramirez 
	
HPSA Communication test meanings:
	https://docs.microfocus.com/itom/Server_Automation:2018.08/Troubleshooting/Troubleshoot_server_communication_tests/Command_Engine_to_Agent_%28AGT%29_test
	
Check Network Adapters Netezza:
	/nz/kit/bin/adm/tools/nznetw --all
	
As for checking if splunk is running try this as splunk user:
	/opt/splunkforwarder/bin/splunk status
It should return similar results as you have received from “service splunk status”.

Server not in vSphere:
	https://tdc-vcenter01.bbtnet.com/ui/#?extensionId=vsphere.core.inventory.serverObjectViewsExtension&objectId=urn:vmomi:VirtualMachine:vm-6213321:a1e810ac-89e0-4735-ad89-b193d1d23858&navigator=vsphere.core.viTree.hostsAndClustersView