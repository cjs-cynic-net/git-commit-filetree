#/bin/bash
. t/test-lib.sh
echo "1..3"

##### 1

start_test 'Check usage return value'
status=$(git commit-filetree >/dev/null 2>&1; echo $?)
test_equal 129 $status
end_test

##### 2

start_test 'Check usage message (no args)'
expected="Usage: git commit-filetree <branch> <path>"
actual=$(git commit-filetree 2>&1 >/dev/null || true)
test_equal "$expected" "$actual"
end_test

##### 3

start_test 'Check usage message (1 arg)'
actual=$(git commit-filetree foobar 2>&1 >/dev/null || true)
test_equal "$expected" "$actual"
end_test

exit 0
