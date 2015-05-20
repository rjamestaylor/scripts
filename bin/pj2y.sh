#!/bin/sh

JFILE=$1

ruby -ryaml -rjson -e 'puts YAML.dump(JSON.parse(STDIN.read))' < $JFILE
