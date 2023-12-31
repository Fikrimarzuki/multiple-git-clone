#!/bin/sh

source p0-variables.sh
source p0-functions.sh

validate_arguments $1 $2 $3 $4
check_challenge_type $1 $2
check_student_list $3

echo $'START UNARCHIVING\n'
for element in $students
do
  echo "|| Unarchiving $element... ||"
  (cd "$folderPath/$element" && gh repo archive -y && cd ../../../) || echo "Failed to unarchive $element"
  echo $'\n\n'
done
