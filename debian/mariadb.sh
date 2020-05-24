function _maria {
  
  apt remove mariadb-server mariadb-client --purge
  
  MSG="Installing Maria DB Server & Client 10.2";
  
  apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xF1656F24C74CD1D8
  add-apt-repository 'deb [arch=amd64] http://ftp.icm.edu.pl/pub/unix/database/mariadb/repo/10.2/debian stretch main'
  apt update
  apt install mariadb-server-10.2 mariadb-client-10.2

  ## Copy Config Files
  set +a
  mv /etc/mysql/my.cnf /etc/mysql/my.cnf.orig
  set -a
  cp -rp $MYDIR/files/etc/mysql/my.cnf /etc/mysql
  
  service mysql restart
}

_maria;