FROM ubuntu:bionic

ARG RUNNER_VERSION=2.275.1
ARG ORGANIZATION_URL
ARG RUNNER_TOKEN
ARG RUNNER_LABELS=ci

ADD ./sakura_vps_github_runner.sh /

RUN sed -i -e "s#@@@RUNNER_VERSION@@@#$RUNNER_VERSION#g" /sakura_vps_github_runner.sh && \
    sed -i -e "s#@@@ORGANIZATION_URL@@@#$ORGANIZATION_URL#g" /sakura_vps_github_runner.sh && \
    sed -i -e "s#@@@RUNNER_TOKEN@@@#$RUNNER_TOKEN#g" /sakura_vps_github_runner.sh && \
    sed -i -e "s#@@@RUNNER_LABELS@@@#$RUNNER_LABELS#g" /sakura_vps_github_runner.sh

CMD [ "bash", "/sakura_vps_github_runner.sh" ]
