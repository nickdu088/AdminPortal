function list_child_processes () {
    local ppid=$1;
    local current_children=$(pgrep -P $ppid);
    local local_child;
    if [ $? -eq 0 ];
    then
        for current_child in $current_children
        do
          local_child=$current_child;
          list_child_processes $local_child;
          echo $local_child;
        done;
    else
      return 0;
    fi;
}

ps 50998;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 50998 > /dev/null;
done;

for child in $(list_child_processes 51034);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/yuliang/Desktop/IT/AdminPortal/bin/Debug/net6.0/2597768a05774913940b636e0194a4a1.sh;
