set fecha=%date:~10,4%%date:~4,2%%date:~7,2%
mysqldump -u root -p C:\backups\control_escolar > C:\backups\control_escolar_backup_%fecha%.sql