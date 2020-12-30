set -eu

RUNNER_VERSION=@@@RUNNER_VERSION@@@
RUNNER_FILENAME=actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
RUNNER_URL=https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/${RUNNER_FILENAME}

# Install Dependencies to fetch GitHub Runner
apt update
apt install -y \
    tar \
    curl

# Fetch GitHub Runner
mkdir /actions-runner
curl -L "${RUNNER_URL}" | tar xz -C /actions-runner
cd /actions-runner

# Install Dependencies
./bin/installdependencies.sh

# Create Temporary User and configure GitHub Runner
useradd temp
chown -R temp:temp /actions-runner
su - temp <<EOF
ORGANIZATION_URL=@@@ORGANIZATION_URL@@@
RUNNER_TOKEN=@@@RUNNER_TOKEN@@@
RUNNER_LABELS=@@@RUNNER_LABELS@@@

cd /actions-runner
./config.sh --url "\${ORGANIZATION_URL}" --token "\${RUNNER_TOKEN}" --labels "\${RUNNER_LABELS}"
EOF
chown -R root:root /actions-runner
userdel temp

# Install GitHub Runner as a service
./svc.sh install

# Start GitHub Runner as a service
./svc.sh start
