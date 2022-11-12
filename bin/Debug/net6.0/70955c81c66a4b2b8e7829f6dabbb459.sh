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

ps 50530;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 50530 > /dev/null;
done;

for child in $(list_child_processes 50589);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/yuliang/Desktop/IT/AdminPortal/bin/Debug/net6.0/70955c81c66a4b2b8e7829f6dabbb459.sh;
