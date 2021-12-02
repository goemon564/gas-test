#!/bin/sh

echo "shellを起動"

devScriptId='{"scriptId":"1haaORBkPw_C6_V_H289SsHKKX5dYI94cXUcVU5g8Gj37GSDzs2tWUTPW"}'
prdScriptId='{"scriptId":"1QspfVSogtAphpD9kxbOyx_7ov14OtafwbQVEEo2HbihXSoIK1TTApu1v"}'

if [ $1 = "-e" -a $2 = "dev" ]; then
    echo "dev環境に反映します"
    eval echo '${devScriptId}' > .clasp.json
    eval "git checkout develop"
    eval "git pull"
    eval "clasp push"
    # eval echo "" > .clasp.json
elif [ $1 = "-e" -a $2 = "prd" ]; then
    echo "prd環境に反映します"
    eval echo '${prdScriptId}' > .clasp.json
    eval "git checkout release"
    eval "git pull"
    eval "clasp push"
    # eval echo "" > .clasp.json
else
    echo "コマンドが足りません"
fi
