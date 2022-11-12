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

ps 46741;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 46741 > /dev/null;
done;

for child in $(list_child_processes 46778);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/yuliang/Desktop/IT/AdminPortal/bin/Debug/net6.0/88438ec8f7b24cfdadf1d0c33be74ed7.sh;
