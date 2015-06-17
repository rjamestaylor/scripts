#!/bin/sh

TYPE=$1
ENVIRONMENT=$2
STACK=$3

function usage {
    echo "Usage:  $0 <aws-type> <environment: prod|stage> <stack-name>"
    echo "ex: $0 rds prod dps-pecs-prod01-ue1-rds-b"
    exit -1
}

[ "$#" -lt 3 ] && usage

[ ! -d "$TYPE" ] && echo "Error: directory $TYPE not found!" && usage

[ ! -f "$TYPE/$TYPE-template.json" ] && echo "Error: file $TYPE/$TYPE-template.json not found!" && usage

aws --profile dps_$ENVIRONMENT cloudformation get-template --stack-name $STACK | jq '.[]' > ~/tmp/live.json
pj2y.sh ~/tmp/live.json > ~/tmp/live.yaml
pj2y.sh $TYPE/$TYPE-template.json > ~/tmp/$TYPE-template.yaml

echo diff -Naur ~/tmp/live.yaml ~/tmp/$TYPE-template.yaml 
diff -Naur ~/tmp/live.yaml ~/tmp/$TYPE-template.yaml 
