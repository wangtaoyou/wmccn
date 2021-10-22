echo "/*start*/";
# Delcare Base_Dir
Base_Dir="/app/backup"
# Declare CurrentDate
CurrentDate="${Base_Dir}/`date +"%Y%m%d"`"
FTP_Dir="/app/backup/Latest"
cd ${FTP_Dir}
rm -Rf *
if [ ! -d "$CurrentDate" ];then
mkdir -p $CurrentDate
fi

Application="${Base_Dir}/Application"
Log="${Base_Dir}/logs"
if [ ! -d "$Application" ];then
mkdir -p $Application
fi
if [ ! -d "$Log" ];then
mkdir -p $Log
fi

cd /app/Oracle/Middleware/user_projects/epmsystem3/EssbaseServer/essbaseserver1/bin
./startMaxl.sh ${Base_Dir}/scripts/BackupZD.txt;

cd ${Base_Dir}

tar -zcvf $(date "+%Y-%m-%d-%H").log.tar.gz logs
tar -zcvf $(date "+%Y-%m-%d-%H").App.tar.gz Application

cp *.tar.gz $CurrentDate
mv *.tar.gz ${FTP_Dir}


rm -Rf logs/
rm -Rf Application/
echo "/*stop*/";
exit;