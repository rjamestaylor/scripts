#!/bin/sh

YFILE=$1

python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout)' < $YFILE |jq '.'
