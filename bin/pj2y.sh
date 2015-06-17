#!/bin/sh

JFILE=$1

python -c 'import sys, yaml, json; yaml.safe_dump(json.load(sys.stdin), sys.stdout, default_flow_style=False)' < $JFILE
