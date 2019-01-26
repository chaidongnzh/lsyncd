#!/bin/sh
cat <<EOF > /etc/supervisord.conf
[supervisord]
nodaemon=true

EOF

if [[ $sshd_enable ]];then
cat <<EOF >> /etc/supervisord.conf 
[program:sshd]
command=/usr/sbin/sshd  -D
user=root
autostart=true
autorestart=unexpected
numprocs=1
startsecs = 0
stdout_logfile=/dev/fd/1
stdout_logfile_maxbytes=0

EOF
fi


if [[ $lsyncd_enable ]];then
cat <<EOF >> /etc/supervisord.conf
[program:lsyncd]
command=/usr/bin/lsyncd -nodaemon /etc/lsyncd.conf
user=root
autostart=true
autorestart=unexpected
numprocs=1
startsecs = 0
stdout_logfile=/dev/fd/1
stdout_logfile_maxbytes=0

EOF
fi

if [[ $crontab_enable ]];then
cat <<EOF >> /etc/supervisord.conf 
[program:crontab]
command=/usr/sbin/crond -f -c /etc/crontabs
user=root
autostart=true
autorestart=unexpected
numprocs=1
startsecs = 0
stdout_logfile=/dev/fd/1
stdout_logfile_maxbytes=0

EOF
fi

if [[ $rsync_enable ]];then
cat <<EOF >> /etc/supervisord.conf 
[program:rsync]
command=/usr/bin/rsync --daemon --no-detach -v --config=/etc/rsyncd.conf
user=root
autostart=true
autorestart=unexpected
numprocs=1
startsecs = 0
stdout_logfile=/dev/fd/1
stdout_logfile_maxbytes=0

EOF
fi

/usr/bin/supervisord  -c /etc/supervisord.conf
