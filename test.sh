#!/bin/bash
set -eu

RUNNER_VERSION=${RUNNER_VERSION:-2.275.1}
ORGANIZATION_URL=${ORGANIZATION_URL}
RUNNER_TOKEN=${RUNNER_TOKEN}
RUNNER_LABELS=${RUNNER_LABELS:-ci}

cp ./sakura_vps_github_runner.sh ./tmp.sh

sed -i -e "s#@@@RUNNER_VERSION@@@#$RUNNER_VERSION#g" ./tmp.sh
sed -i -e "s#@@@ORGANIZATION_URL@@@#$ORGANIZATION_URL#g" ./tmp.sh
sed -i -e "s#@@@RUNNER_TOKEN@@@#$RUNNER_TOKEN#g" ./tmp.sh
sed -i -e "s#@@@RUNNER_LABELS@@@#$RUNNER_LABELS#g" ./tmp.sh

bash ./tmp.sh
rm ./tmp.sh
