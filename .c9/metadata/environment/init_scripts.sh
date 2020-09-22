{"filter":false,"title":"init_scripts.sh","tooltip":"/init_scripts.sh","undoManager":{"mark":10,"position":10,"stack":[[{"start":{"row":0,"column":0},"end":{"row":1,"column":0},"action":"insert","lines":["~/environment/init_scripts/cli_tools.sh ",""],"id":1}],[{"start":{"row":1,"column":0},"end":{"row":2,"column":0},"action":"insert","lines":["",""],"id":3},{"start":{"row":2,"column":0},"end":{"row":3,"column":0},"action":"insert","lines":["",""]}],[{"start":{"row":3,"column":0},"end":{"row":4,"column":0},"action":"insert","lines":["rm -vf ${HOME}/.aws/credentials",""],"id":4}],[{"start":{"row":2,"column":0},"end":{"row":3,"column":0},"action":"insert","lines":["",""],"id":8}],[{"start":{"row":2,"column":0},"end":{"row":3,"column":0},"action":"insert","lines":["source ~/.bash_profile",""],"id":9}],[{"start":{"row":3,"column":0},"end":{"row":4,"column":0},"action":"remove","lines":["",""],"id":10}],[{"start":{"row":5,"column":0},"end":{"row":6,"column":0},"action":"insert","lines":["",""],"id":11}],[{"start":{"row":6,"column":0},"end":{"row":13,"column":0},"action":"insert","lines":["export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)","export AWS_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region')","","echo \"export ACCOUNT_ID=${ACCOUNT_ID}\" >> ~/.bash_profile","echo \"export AWS_REGION=${AWS_REGION}\" >> ~/.bash_profile","aws configure set default.region ${AWS_REGION}","aws configure get default.region",""],"id":12}],[{"start":{"row":13,"column":0},"end":{"row":14,"column":0},"action":"insert","lines":["",""],"id":13}],[{"start":{"row":14,"column":0},"end":{"row":16,"column":0},"action":"insert","lines":["aws sts get-caller-identity","",""],"id":14}],[{"start":{"row":0,"column":0},"end":{"row":1,"column":0},"action":"remove","lines":["~/environment/init_scripts/cli_tools.sh ",""],"id":15},{"start":{"row":0,"column":0},"end":{"row":1,"column":0},"action":"remove","lines":["",""]}]]},"ace":{"folds":[],"scrolltop":118,"scrollleft":0,"selection":{"start":{"row":14,"column":0},"end":{"row":14,"column":0},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":6,"state":"start","mode":"ace/mode/sh"}},"timestamp":1600669152591,"hash":"decb5931be84310d3cf08d51af6ff5287ce6feff"}