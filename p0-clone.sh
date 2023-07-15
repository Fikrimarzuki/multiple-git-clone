#!/bin/sh

source p0-variables.sh
source p0-functions.sh

validate_arguments $1 $2 $3 $4
check_batch $4
create_parent_folder $1
check_student_list $3

echo $'START CLONING\n'
for element in $students
do
  check_challenge_type $1 $2
  echo "cloning $element into folder $folderPath"
  check_root_folder

  git clone https://github.com/$batchName/$prefixCh-$element
  mv ./$prefixCh-$element ./$element
  echo $'Done clone $element\n\n'
done