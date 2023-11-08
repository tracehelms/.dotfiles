function kill_by_name
  set NAME $argv[1]
  printf "%s\n" "Killing all processes that match '$NAME' with PIDs:"
  ps -ef | grep $NAME | awk '{print $2}'
  ps -ef | grep $NAME | awk '{print $2}' | xargs kill -9
end
