#!/bin/bash

init() {
	if [ -z "$KETTLE_HOME" ]; 
	then
		echo "Please define the KETTLE_HOME variable in the configuration file."
		exit
	fi

	if [ -z "$KETTLE_DIR" ];                                                
	then                                                                     
		echo "Please define the KETTLE_DIR variable in the configuration file."
		exit
	fi

  if [ -n "$KETTLE_JAVA_HOME" ];
  then                       
    echo "Overriding KETTLE default JVM: $KETTLE_JAVA_HOME"
    export PENTAHO_JAVA_HOME=$KETTLE_JAVA_HOME                            
  fi  

	if [ -n "$KETTLE_JVM_MEM" ];
	then
		echo "Overriding KETTLE default JVM mem size: $KETTLE_JVM_MEM"
		export JAVAMAXMEM=$KETTLE_JVM_MEM
	fi

	export KETTLE_HOME="$KETTLE_HOME"
	cd $KETTLE_DIR
}

check_args () {
	local total_args=$1
	local target_args=$2

	if [ $total_args -ne $target_args ];
	then
		echo "Error: Arguments Expected - $total_args - Received - $target_args"
		exit
	fi
}
