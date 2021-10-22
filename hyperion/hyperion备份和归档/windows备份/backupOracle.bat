set param_homeBak_Local=d:\hyperion_backup

set param_delFileDay_Local=20

set param_oracleServerBin=D:\Oracle\Middleware\dbclient64\BIN
set param_LocalNetServicesName=e1046-0001:1521/dsdb

set User01=EPM_SYS_CM
set User02=EPM_SYS_EAS
set User03=EPM_SYS_FDM
set User04=EPM_SYS_FOUND
set User05=EPM_SYS_HAVA
set User06=EPM_SYS_PLN
set User07=EPM_PLN_APP01
set User08=EPM_PLN_APP02
set User09=EPM_PLN_APP03
set User10=EPM_PLN_APP04
set User11=EPM_PLN_APP05
set User12=EPM_PLN_Retail02
set User13=EPM_PLN_APP51
set User14=EPM_PLN_EGG01
set User15=EPM_PLN_FMCG01
set User16=EPM_PLN_HQ01
set User17=EPM_PLN_APP52
set User18=EPM_PLN_APP0301


set Pass01=Passw0rd
set Pass02=Passw0rd
set Pass03=Passw0rd
set Pass04=Passw0rd
set Pass05=Passw0rd
set Pass06=Passw0rd
set Pass07=Passw0rd
set Pass08=Passw0rd
set Pass09=Passw0rd
set Pass10=chiatai#1
set Pass11=Passw0rd
set Pass12=Passw0rd
set Pass13=Passw0rd
set Pass14=Passw0rd
set Pass15=Passw0rd
set Pass16=Passw0rd
set Pass17=Passw0rd
set Pass18=Passw0rd

::::::::::::::::::::::::::::::::::::::::::::::::::::: 生成日期 用于备份
set CurrentDateTime=%date:~0,10%#%time:~0,6%
set CurrentDateTime=%CurrentDateTime::=%
set CurrentDateTime=%CurrentDateTime:-=%
set CurrentDateTime=%CurrentDateTime: =%
set CurrentDateTime=%CurrentDateTime:/=%
::::::::::::::::::::::::::::::::::::::::::::::::::::: 重新设置变量
: Home_Backup 当前bat位置
set Home_Backup=%~dp0

set HomeBak_Local=%Home_Backup%
set HomeBak_Remote=%Home_Backup%

if not "%param_homeBak_Local%"=="" ( set HomeBak_Local=%param_homeBak_Local%)
if not "%param_homeBak_Remote%"=="" ( set HomeBak_Remote=%param_homeBak_Remote%)
if "%param_delFileDay_Local%"=="" ( set param_delFileDay_Local=7)
if "%param_delFileDay_Remote%"=="" ( set param_delFileDay_Remote=1)

set HomeBak_KeyName=OracleDB

set HomeBak_Local=%HomeBak_Local%\%HomeBak_KeyName%_bakLocal
set HomeBak_Remote=%HomeBak_Remote%\%HomeBak_KeyName%_bakRemote

set homeBak_TimeFolder=%CurrentDateTime%_%HomeBak_KeyName%

set homeBak_TimeFolder_Local=%HomeBak_Local%\%homeBak_TimeFolder%
set homeBak_TimeFolder_Remote=%HomeBak_Remote%\%homeBak_TimeFolder%

::::::::::::::::::::::::::::::::::::::::::::::::::::: 
: 创建新的文件名
set FileName_01=%homeBak_TimeFolder_Local%\%User01%
set FileName_02=%homeBak_TimeFolder_Local%\%User02%
set FileName_03=%homeBak_TimeFolder_Local%\%User03%
set FileName_04=%homeBak_TimeFolder_Local%\%User04%
set FileName_05=%homeBak_TimeFolder_Local%\%User05%
set FileName_06=%homeBak_TimeFolder_Local%\%User06%
set FileName_07=%homeBak_TimeFolder_Local%\%User07%
set FileName_08=%homeBak_TimeFolder_Local%\%User08%
set FileName_09=%homeBak_TimeFolder_Local%\%User09%
set FileName_10=%homeBak_TimeFolder_Local%\%User10%
set FileName_11=%homeBak_TimeFolder_Local%\%User11%
set FileName_12=%homeBak_TimeFolder_Local%\%User12%
set FileName_13=%homeBak_TimeFolder_Local%\%User13%
set FileName_14=%homeBak_TimeFolder_Local%\%User14%
set FileName_15=%homeBak_TimeFolder_Local%\%User15%
set FileName_16=%homeBak_TimeFolder_Local%\%User16%
set FileName_17=%homeBak_TimeFolder_Local%\%User17%
set FileName_18=%homeBak_TimeFolder_Local%\%User18%
::::::::::::::::::::::::::::::::::::::::::::::::::::: 创建文件夹,删除N天前的备份文件夹

:删除文件夹相同的备份,之后重新备份
call rd %homeBak_TimeFolder_Local% /S /Q
:创建文件夹
call md %homeBak_TimeFolder_Local%

:删除N天前的备份文件夹
call forfiles /p %HomeBak_Local% /s /m *  /d -%param_delFileDay_Local% /c  "cmd /c if @ISDIR==TRUE RD /s/q @PATH"
call forfiles /p %HomeBak_Remote% /s /m *  /d -%param_delFileDay_Remote% /c  "cmd /c if @ISDIR==TRUE RD /s/q @PATH"

::::::::::::::::::::::::::::::::::::::::::::::::::::: 备份Oracle

if not "%param_oracleServerBin%"=="" (
	%param_oracleServerBin:~0,2%
	cd %param_oracleServerBin%
)	

if not "%User01%"=="" (if not "%Pass01%"=="" (call exp %User01%/%Pass01%@%param_LocalNetServicesName% owner=%User01% file=%FileName_01%.dmp log=%FileName_01%.log))
if not "%User02%"=="" (if not "%Pass02%"=="" (call exp %User02%/%Pass02%@%param_LocalNetServicesName% owner=%User02% file=%FileName_02%.dmp log=%FileName_02%.log))
if not "%User03%"=="" (if not "%Pass03%"=="" (call exp %User03%/%Pass03%@%param_LocalNetServicesName% owner=%User03% file=%FileName_03%.dmp log=%FileName_03%.log))
if not "%User04%"=="" (if not "%Pass04%"=="" (call exp %User04%/%Pass04%@%param_LocalNetServicesName% owner=%User04% file=%FileName_04%.dmp log=%FileName_04%.log))
if not "%User05%"=="" (if not "%Pass05%"=="" (call exp %User05%/%Pass05%@%param_LocalNetServicesName% owner=%User05% file=%FileName_05%.dmp log=%FileName_05%.log))
if not "%User06%"=="" (if not "%Pass06%"=="" (call exp %User06%/%Pass06%@%param_LocalNetServicesName% owner=%User06% file=%FileName_06%.dmp log=%FileName_06%.log))
if not "%User07%"=="" (if not "%Pass07%"=="" (call exp %User07%/%Pass07%@%param_LocalNetServicesName% owner=%User07% file=%FileName_07%.dmp log=%FileName_07%.log))
if not "%User08%"=="" (if not "%Pass08%"=="" (call exp %User08%/%Pass08%@%param_LocalNetServicesName% owner=%User08% file=%FileName_08%.dmp log=%FileName_08%.log))
if not "%User09%"=="" (if not "%Pass09%"=="" (call exp %User09%/%Pass09%@%param_LocalNetServicesName% owner=%User09% file=%FileName_09%.dmp log=%FileName_09%.log))
if not "%User10%"=="" (if not "%Pass10%"=="" (call exp %User10%/%Pass10%@%param_LocalNetServicesName% owner=%User10% file=%FileName_10%.dmp log=%FileName_10%.log))
if not "%User11%"=="" (if not "%Pass11%"=="" (call exp %User11%/%Pass11%@%param_LocalNetServicesName% owner=%User11% file=%FileName_11%.dmp log=%FileName_11%.log))
if not "%User12%"=="" (if not "%Pass12%"=="" (call exp %User12%/%Pass12%@%param_LocalNetServicesName% owner=%User12% file=%FileName_12%.dmp log=%FileName_12%.log))
if not "%User13%"=="" (if not "%Pass13%"=="" (call exp %User13%/%Pass13%@%param_LocalNetServicesName% owner=%User13% file=%FileName_13%.dmp log=%FileName_13%.log))
if not "%User14%"=="" (if not "%Pass14%"=="" (call exp %User14%/%Pass14%@%param_LocalNetServicesName% owner=%User14% file=%FileName_14%.dmp log=%FileName_14%.log))
if not "%User15%"=="" (if not "%Pass15%"=="" (call exp %User15%/%Pass15%@%param_LocalNetServicesName% owner=%User15% file=%FileName_15%.dmp log=%FileName_15%.log))
if not "%User16%"=="" (if not "%Pass16%"=="" (call exp %User16%/%Pass16%@%param_LocalNetServicesName% owner=%User16% file=%FileName_16%.dmp log=%FileName_16%.log))
if not "%User17%"=="" (if not "%Pass17%"=="" (call exp %User17%/%Pass17%@%param_LocalNetServicesName% owner=%User17% file=%FileName_17%.dmp log=%FileName_17%.log))
if not "%User18%"=="" (if not "%Pass18%"=="" (call exp %User18%/%Pass18%@%param_LocalNetServicesName% owner=%User18% file=%FileName_18%.dmp log=%FileName_18%.log))
echo %date% %time% >>%homeBak_TimeFolder_Local%\备份结束时间_测试_可删除.txt
