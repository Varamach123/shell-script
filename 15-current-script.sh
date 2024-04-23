#/bin/bash
 
COURSE="Devops from current script"

echo "Before calling other script, course: $COURSE"
echo "Process id of the current shell script: $$"

./16-other-script.sh

echo "after calling other script, course: $COURSE"


