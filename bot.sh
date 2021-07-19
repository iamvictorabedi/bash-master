#!/bin/bash
mkdir /workspace/bash-master
cd /workspace/bash-master
git clone  --bare https://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@github.com/iamvictorabedi/bash-master.git -b master
export NAME=iamvictorabedi
touch main.tf
cat << EOF > main.tf
The current working directory is: $NAME
You are logged in as $(whoami)
EOF
git add .
git commit -m "new workflow for $NAME"
git push https://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@github.com/iamvictorabedi/bash-master.git master