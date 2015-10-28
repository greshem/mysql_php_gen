clear
ls
polipo -h
vim config 
polipo
mkdir /var/log/polipo
polipo
nohup polipo&
clear
curl -x http://127.0.0.1:8123 baidu.com
cd /home/product/
ls
cd git/
ls
cd scrapy_spider/
ls
cd douban/
ls
rm -rf douban.log SCHEDULER_DIR-2/
ls
git status
git checkout douban/settings.py
git pull
clear
ls
cd douban/
ls
cd deployment/
ls
./init_mongodb_douban_sitemap.py 
ll
cd ..
ll
chown product:product settings.py settings.example 
ll
cd deployment/
ls
ll
chown product:product *
ll
cd ..
ls
cd pipelines/
chown product:product *
ll
cd ..
ls
cd spiders/
ll
cd ..
ls
cd middlewares/
ll
chown product:product *
cd ..
ls
cd ..
ll
cd ..
ls
ll
chown product:product *
ls /home
cd /var/log/mongodb/
ls
ll
tail mongod.log-20151025 
tail mongodb.log-20151025 
tail -20 mongodb.log-20151025 
ll
vim mongodb.log-20151025 
mongo
clear
service --status-all
ps aux | grep tor
ps -e | grep tor
curl -x socks5:192.168.1.11:9050 baidu.com
clear
ps aux | grep tor
service --status-all
ps aux | grep polipo
clear
cd ..
ls
vim polipo/log 
ps aux | grep polipo
service --status-all
curl baidu.com
clear
service --status-all
service 
service --status-all
systemctl  
systemctl  list
systemctl  
systemctl  mongod start
journalctl  -xn mongod
journalctl  -xn
cd /var/log/mongodb/
ls
cat mongodb.log
cat *.log
debuginfo-install  mongod
yum search mongo
yum install mogodb
debuginfo-install  mongodb
ls
cat *.log |c++fq
cat *.log |c++filt 
debuginfo-install  mongodb
ls
cd bin/n
cd bin/ 
svn update  
ls
cd
ls
useradd  daemon-user
useradd  git 
vim /etc/sudoers
cd /var/www/html/phabricator/
ls
./bin/config set phd.user daemon-user
./bin/config set diffusion.ssh-user git
cp  resources/sshd/phabricator-ssh-hook.sh /usr/libexec/phabricator-ssh-hook.sh 
vim /usr/libexec/phabricator-ssh-hook.sh 
sed 's/vcs-user/git/g'  /usr/libexec/phabricator-ssh-hook.sh  -i
sed 's|/path/to/phabricator|/var/www/html/phabricator/|g'   -i 
sed -i  's|/path/to/phabricator|/var/www/html/phabricator/|g'    /usr/libexec/phabricator-ssh-hook.sh  
vim /usr/libexec/phabricator-ssh-hook.sh 
cp  resources/sshd/sshd_config.phabricator.example    /etc/ssh/sshd_config.phabricator
vim /etc/ssh/sshd_config.phabricator 
sed 's/vcs-user/git/g'   /etc/ssh/sshd_config.phabricator -i 
vim /etc/ssh/sshd_config.phabricator 
vim /etc/ssh/sshd_config
sed -i   's/#Port 22/Port 2222/g'  /etc/ssh/sshd_config 
vim /etc/ssh/sshd_config
/usr/sbin/sshd  -f /etc/ssh/sshd_config
lsof -i:2222
history  -w
ls
cd bin/n
cd bin/ 
svn update  
ls
cd
ls
useradd  daemon-user
useradd  git 
vim /etc/sudoers
cd /var/www/html/phabricator/
ls
./bin/config set phd.user daemon-user
./bin/config set diffusion.ssh-user git
cp  resources/sshd/phabricator-ssh-hook.sh /usr/libexec/phabricator-ssh-hook.sh 
vim /usr/libexec/phabricator-ssh-hook.sh 
sed 's/vcs-user/git/g'  /usr/libexec/phabricator-ssh-hook.sh  -i
sed 's|/path/to/phabricator|/var/www/html/phabricator/|g'   -i 
sed -i  's|/path/to/phabricator|/var/www/html/phabricator/|g'    /usr/libexec/phabricator-ssh-hook.sh  
vim /usr/libexec/phabricator-ssh-hook.sh 
cp  resources/sshd/sshd_config.phabricator.example    /etc/ssh/sshd_config.phabricator
vim /etc/ssh/sshd_config.phabricator 
sed 's/vcs-user/git/g'   /etc/ssh/sshd_config.phabricator -i 
vim /etc/ssh/sshd_config.phabricator 
vim /etc/ssh/sshd_config
sed -i   's/#Port 22/Port 2222/g'  /etc/ssh/sshd_config 
vim /etc/ssh/sshd_config
/usr/sbin/sshd  -f /etc/ssh/sshd_config
lsof -i:2222
history  -w
vim /root/.bash_history 
/usr/sbin/sshd -f /etc/ssh/sshd_config.phabricator
ssh-keygen -t dsa -b 1024 -f /etc/ssh/ssh_host_dsa_key
/usr/sbin/sshd -f /etc/ssh/sshd_config.phabricator
lsof -i:22
ssh git@localhost
vim /etc/passwd
ssh git@localhost
vim /etc/ssh/sshd_config.phabricator 
service sshd restart
lsof -i:22
lsof -i:22 |awk '{print $2}' 
lsof -i:22 |awk '{print $2}'  |xargs kill -9 
uptime
rpm -ql git
rpm -ql git |more
cd /usr/libexec/git-core/
ls
./git-merge
cd mergetools/
ls
vim ecmerge 
ls
pwd
dir 01
dir -1
dir -r $(pwd)/
dir -r $(pwd)/ -1
pwd
cd /var/repo/
ls
cd NOVA/
ls
git  show
git reflog
ls
cd /tp3
ls
cd /tmp3/
ls
cd /tmp
ls
cd /var/www/html/
ls
cp -a -r  /var/repo/NOVA/  ./
cd NOVA/
ls
git --help  |grep update
git 
ls /usr/libexec/git-core/ |grep update
git  update-server-info
ls
cd ..
ls
back_dir.pl  |grep NOVAS
back_dir.pl  |grep NOVA
back_dir.pl  |grep NOVA |sh 
scp NOVA.tar.gz  192.168.1.22:/var/www/html/
ls
cd /var/log/mongodb/
ls
cat *.log
cat *.log |c++filt 
gdb /usr/bin/mongod
objdump -S /usr/bin/mongod
objdump -S /usr/bin/mongod > /tmp/tmp.asm
cat *.log |c++filt 
cat *.log |c++filt  > /tmp/tmp
vim /tmp/tmp.asm 
objdump --help |grep source
vim /tmp/tmp.asm 
vim /tmp/tmp2.asm 
which mongod
gdb /usr/bin/mongod
clear
ls
ssh -p 2222 192.168.1.23
cd
ls
useradd   daemon-user
vim /etc/sudoers
sudo hukai ifconfig
clear
ls
cat weka.log 
ls
rm weka.log 
ls
cd /home/
ls
cd hukai/
cd ..
cd git/
ls
vim README.md 
cd
ls
cd /var/www/html/phabricator/
ls
cp  resources/sshd/phabricator-ssh-hook.sh /usr/libexec/phabricator-ssh-hook.sh 
cp  resources/sshd/sshd_config.phabricator.example    /etc/ssh/sshd_config.phabricator
vim /etc/ssh/sshd_config.phabricator 
vim /usr/libexec/phabricator-ssh-hook.sh 
clear
cd
cd bin/
svn update  
cd /tmp
ls
c++filt  tmp.asm  > tmp2.asm 
vim tmp2.asm 
cat  tmp.asm |c++filt  > tmp2.asm 
cat tmp
cd /var/crash/
ls
cd /var/log/mongodb/
ls
cat mongod.log.2015-10-24T19-30-09 
ls
find -type f -empty 
find -type f -empty  |xargs r -f
find -type f -empty  |xargs  rm -f 
ls
vim mongod.log-20151025 
vim mongod.log
c++filt mongod.log
cat  mongod.log
cat  mongod.log |c++filt 
ls
mv * back/
mkdir back
mv * back/
ls
systemctl   start  mongodb 
systemctl   start  mongod
ls
cat mongodb.log 
ls
cd back/
ls
vim mongod.log-20151025 
vim mongod.log
clear
ls
pgrep mong
systemctl  |grep mongo
systemctl 
ls
cat mongodb.log-201510
ls
cd
cd bin/
ls |grep sys
ls |grep ifcfg
vim ifcfg_ifconfig_as_em_eth_cfg_template.pl 
cd /var/www/html/
ls
cd phabricator/
ls
grep 192.168.1.21 -R ./
ls
su git
clear
ps aux | grep ssserver
ps -e | grep ssserver
ps -e | grep sserver
ps aux | grep sserver
ps aux | grep ssserver
systemctl
systemctl | grep ssserver
mongo
systemctl | grep tor
ps aux | grep tor
curl -x socks5://127.0.0.1:9050 baidu.com
curl -x http://127.0.0.1:8123 baidu.com
exit
ls
/usr/sbin/sshd -f /etc/ssh/sshd_config.phabricator 
lsof -i:22
ssh git@localhost
ls
ssh_nopasswd_new.sh  localhost
cat /bin/ssh_nopasswd_new.sh 
cat /root/.ssh/id_rsa.pub   >> /root/.ssh/authorized_keys
ssh root@localhost
ssh -p root@localhost
ssh -p 2222  root@localhost
ssh locahost
ssh localhost
ssh git@localhost
ssh-keygen -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key
ssh git@localhost
ls
cat .ssh/id_rsa.pub 
ssh git@localhost
ssh git@localhost  conduit
ssh git@localhost  conduit ping
ls
cd /var/www/html/
cd /var/repo/
ls
cd /tmp
ls
git clone ssh://git@192.168.1.11/diffusion/NOVA/nova.git
vim /etc/sudo.conf 
vim /etc/sudoers
git clone ssh://git@192.168.1.11/diffusion/NOVA/nova.git
pgrep ssh 
lsof -i:22
kill -9  19315
/usr/sbin/sshd -f /etc/ssh/sshd_config.phabricator
lsof -i:22
git clone ssh://git@192.168.1.11/diffusion/NOVA/nova.git
vim /etc/sudoers
lsof -i:22
kill -9 22451
/usr/sbin/sshd -f /etc/ssh/sshd_config.phabricator
git clone ssh://git@192.168.1.11/diffusion/NOVA/nova.git
ls
cd  nova/
ls
vim babel.cfg 
git commit -m "mdf_1m: " babel.cfg
git push 
chmod 777 -R /var/repo/*
git push 
clear
ls
cd
ls
git clone http://192.168.1.21/diffusion/CCSPIDER/ccspider.git
git clone ssh://192.168.1.21/diffusion/CCSPIDER/ccspider.git
ls
cat .ssh/id_rsa.pub 
git clone http://192.168.1.21/diffusion/CCSPIDER/ccspider.git
git clone ssh://192.168.1.21/diffusion/CCSPIDER/ccspider.git
git clone ssh://192.168.1.21/diffusion/GITREPO/gitrepo.git
ssh git@localhost
ls
cd /tmp3/
ls
cd /tmp
ls
git clone ssh://git@192.168.1.11/diffusion/SPIDERS/zhujian-spider-scrapy.git
ls
rm -rf zhujian-spider-scrapy/
git clone ssh://git@192.168.1.11/diffusion/SPIDERS/zhujian-spider-scrapy.git
cd zhujian-spider-scrapy/
ls
git braches
git brach
git branch
ls
cd 
ls
git clone  https://github.com/SymphonyNo9/scrapy_spider.git
ls
git clone ssh://git@192.168.1.11/diffusion/SPIDERB/spiderb.git
cd spiderb/
ls
cd ..
ls
cd  spiderb/
ls
vim copy_spider_template.sh 
ls
cd template/
ls
cd template/
ls
cd ..
ls
cd ..
ls
vim douban/scrapy.cfg 
ls
cd ..
ls
clear
ls
cd  spiderb/
ls
vim copy_spider_template.sh 
git commit  "test_1m:  "  copy_spider_template.sh
git commit  -m  "test_1m:  "  copy_spider_template.sh
git push
chmod 777 -R /var/repo/SPIDER
chmod 777 -R /var/repo/SPIDERB/
git push 
clear
ls
ifconfig f
ifconfig 
dhclient eno1
ifconfig 
ping 192.168.9.1
route
ping 192.168.1.1
xhost +
exit
cd /home/
ls
cd test/
ls
cd D
cd Do
ls
cd Downloads/
ls
tar -xzvf eclipse-cpp-mars-1-linux-gtk-x86_64.tar.gz 
cd eclipse/
ls
./eclipse 
ls
file eclipse
ls
cd configuration/
ls
cd ..
ls
vim configuration/1445946310686.log 
yum install gtk*
vim /etc/yum.repos.d/CentOS-Debuginfo.repo 
yum install gtk
LANG=C
yum install gtk
yum search gtk
yum install gtk*
sudo virtmanager
exit
ls
cd /tmp
ls
cat /etc/samba/smb.conf
cd /tmp3/samba_shared/
ls
mv /tmp/eclipse-cpp-mars-1-linux-gtk-x86_64.tar.gz  ./
ls
touch  eclipse
ls
mv eclipse eclipse.bak
ls
mkdir eclipse
ls
rm eclipse.bak 
ls
mv eclipse-cpp-mars-1-linux-gtk-x86_64.tar.gz  eclipse
clear
ls
cd bbb/
ls
cp -a -r  sematic/ /root/
cd
ls
cd  sematic/
ls
du
du -h
cd other/
ls
file *
ls
cd ..
ls
cd Data/
ls
cd ..
ls
vim irresult1.txt 
vim loadindex.sh 
vim orgseach.sh 
vim query_static_pro.sh 
ls
vim seach.sh 
bash seach.sh  linux
LANG=C
bash seach.sh  linux
yum install lucene
yum search lucene
clear
ls
passwd
clear
cd
lsc
lear
clear
ls
cat yum_list 
clear
ls
cd /tmp
ls
git clone ssh://git@192.168.1.21/diffusion/NOVAB/novab.git
cat /root/.ssh/id_rsa.pub 
cd
cd /tmp
git clone ssh://git@192.168.1.21/diffusion/NOVAB/novab.git
ls
cd nova
ls
cd /home/test/
ls
cd /tmp
ls
chmod 777 nova* -R
cd /tmp3/sm
cd /tmp3/
ls
cd
ls
cd /tmp3/
ls
cd samba_shared/
ls
mkdir driver
cd driver/
ls
dd if=/dev/cdrom of=mb_ausa.iso 
lsmod 
lspci 
cd
ls
fdisk -l
dmesg 
ls
fdisk -l
mount  /dev/sdc1  /mnt/sdc1
mkdir /mnt/dir
mount  /dev/sdc1  /mnt/dir/
mount /dev/sdc2  /mnt/dir/
cd /mnt/dir/
ls
cd filetransit0/
ls
cd ..
ls
cd hwf_download/
ls
du
du -h
ls
cd appstore/
ls
cd ..
ls
cd mobile/
ls
cd ..
ls
cd ..
ls
cd  log/
ls
cat syslog
cd ..
ls
cd mentohust/
ls
cd ..
ls
cd opt/
ls
cd ..
ls
cd userdata_root/
ls
cd ..
cd var/
ls
du
du -h
ls
find. 
cd ..
ls
find . 
du
du -h
clear
ls
clear
ls
df
umount /tmp/dir/
umount /mnt/dir/
cd ..
umount /mnt/dir/
clear
ls
cd /tmp3/
ls
cd samba_shared/
ls
cd  mysql_table_php_perl_script_gen_v2/
ls
vim one_step.sh 
ls
vim table_list_template.pl 
ls
cd template/
ls
cd ..
find . |grep v2
vim table_insert_template_2_perlcode
vim table_insert_template_2_perlcode_v2.pl 
ls
vim one_step.sh 
ls
cd tpl_qzjdb_php/
ls
vim table_modify.php.tpl 
cd ..
ls
vim tpl_qzjdb_php.pl 
vim tpl_php_adodb.pl 
svn co http://192.168.1.16/svn/11698666_v2 
echo $LANG
change_lang_2_gb2312.sh 
export LANG="zh_CN.gb2312"
svn co http://192.168.1.16/svn/11698666_v2 
cd 11698666_v2/
ls
mysql -p 
mysql -p  <  localhost.sql.zip.sql 
vim localhost.sql.zip
vim localhost.sql.zip.sql 
file localhost.sql.zip.sql 
vim localhost.sql.zip.sql 
mysql -p  <  localhost.sql.zip.sql 
vim localhost.sql.zip.sql 
mysql -p  <  localhost.sql.zip.sql 
vim localhost.sql.zip.sql 
mysql -p  <  localhost.sql.zip.sql 
mysql -ppassword
vim localhost.sql.zip.sql 
mysql -ppassword > localhost.sql.zip.sql 
rm localhost.sql.zip.sql 
svn update 
mysql -ppassword  <  localhost.sql.zip.sql 
ls
cd ..
ls
vim tpl_qzjdb_php
vim tpl_qzjdb_php.pl 
ls
perl tpl_qzjdb_php.pl 
yum search TEmplate
yum search template 
yum install perl-Template-Toolkit
perl tpl_qzjdb_php.pl 
vim tpl_qzjdb_php.pl 
perl tpl_qzjdb_php.pl  users
ls
cd output/
ls
cd tpl_qzjdb_php_users/
ls
vim table_list.php 
ls
vim table_modifyok.php 
ls
vim table_list.php 
grep password *
sed 's/password/password/g' *.php -i
ls
grep password *
ls
cd ..
ls
cp -a -r  tpl_qzjdb_php_users/ /var/www/html/user/
cd /etc/httpd/conf.d/
ls
mv phabricator.conf  phabricator.conf.bak
service httpd restart
yum install php
cd /var/www/html/
ls
cd user/
ls
vim table_list.php 
php table_list.php 
vim table_list.php 
ls
vim qzj_db.php 
ls
vim db_pages.inc.php 
vim table_list.php 
php  table_list.php 
ls
vim /etc/httpd/conf/httpd.conf 
service httpd restart
ls
vim table_list.php 
ls
vim table_modifyok.php 
grep   connect_db *
vim table_modify.php 
cd
ls
cd /tmp3/
ls
cd samba_shared/
ls
mv  mysql_table_php_perl_script_gen_v2/ /root/
history  -w
