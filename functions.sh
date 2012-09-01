rmdsstore()
{
	find $1 -name ".DS_Store" -exec rm {} \;
}

#
# C utils
#

mcfile()
{
	cat <<EOS > "$1.c"
#include <stdio.h>

int main(int argc, char *argv[])
{
	
	return 0;
}
EOS
}

mmkfile()
{
	cat <<EOS > Makefile
CFLAGS=-Wall -g

all: $1

clean:
	rm -f $1 *.o
EOS
}

mcproj()
{
	take $1
	mcfile main
	mmkfile main
}

#
# Python utils
#

mpyproj()
{
	project_skel=~/code/py_skel/
	
	if [ ! -e $project_skel ]; then
		echo "ERROR: Python project skeleton not found in \"$project_skel\""
		return 1
	fi
	
	cp -r $project_skel $1
	
	find $1 -name "*.pyc" -exec rm {} \;
	
	mv $1/NAME $1/$1
	sed -i '' -e"s/%NAME%/$1/" $1/tests/NAME_tests.py
	mv $1/tests/NAME_tests.py $1/tests/$1_tests.py
	sed -i '' -e"s/%NAME%/$1/" $1/setup.py
	
	cd $1
	return 0
}
