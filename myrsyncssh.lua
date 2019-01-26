settings {
    logfile = "/var/log/lsyncd.log",
    statusFile = "/var/log/lsyncd-status.log",
    insist = true,
    statusInterval = 1,                       --状态文件写入最短时间
    maxDelays = 1                            --最大延迟
}
sync {
    default.rsync,
    source    = "/root/src",
    target    = "rsync://rsync@47.254.19.9:5432/test",
    delete    = true,
    -- excludeFrom = "/etc/rsyncd.d/rsync_exclude.lst",
    rsync     = {
        binary    = "/usr/bin/rsync",
        acls      = true,
        archive   = true,
        compress  = true,
        owner     = true,
        perms     = true,
        verbose   = true,
        password_file = "/etc/rsyncd.secrets"
    }
}
