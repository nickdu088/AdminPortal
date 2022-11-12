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

for child in $(list_child_processes 51014);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/yuliang/Desktop/IT/AdminPortal/bin/Debug/net6.0/e7ae625e9e684a3ea82b98dc9487dda3.sh;
