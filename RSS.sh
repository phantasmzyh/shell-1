#/bin/bash
#统计进程使用的物理内存

for PROC in `ls  /proc/|grep "^[0-9]"`
do
	if [ -f /proc/$PROC/statm ]; then
		TEP=`cat /proc/$PROC/statm | awk '{print ($2)}'`
		RSS=`expr $RSS + $TEP`
	fi
done
RSS=`expr $RSS \* 4`
echo $RSS"KB"
