function kill_by_name
  set NAME $argv[1]
  printf "%s" "Killing all processes that match $NAME:"
  ps -ef | grep $NAME | awk '{print $2}'
  ps -ef | grep $NAME | awk '{print $2}' | xargs kill -9
end
