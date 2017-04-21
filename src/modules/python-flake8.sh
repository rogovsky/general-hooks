if [ $(gitflow_count_commit_files py) -eq 0 ] ; then
	return 0
fi

h1 "Python Flake8 module"

ERROR=0
for file in $(gitflow_commit_files py); do
	if flake8 $file 2>&1 | grep $file >/dev/null ; then
		gitflow_fail $file
		echo $(flake8 $file) | sed "s/^/         ${GREY}--> /"
		ERROR=1
	else
		gitflow_ok $file
	fi
done

return $ERROR
