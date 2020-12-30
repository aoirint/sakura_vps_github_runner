Ubuntu上にGitHub Self-Hosted Runnerをセットアップします。RepositoryまたはOrganizationのURL、およびSettings > Actions > Self-hosted runners > Add new > New runner > Configureから取得できるトークンが必要です（--tokenの部分）。

注意：同じ名前のSelf-Hosted Runnerが既に登録されている場合、スタートアップスクリプトが途中で停止してしまいます。古いRunnerをGitHub上から削除してください。

2020/12/31 7:00時点でUbuntu 16.04、18.04、20.04で動作確認済。

@aoirint

https://github.com/aoirint/sakura_vps_github_runner

https://docs.github.com/en/free-pro-team@latest/actions/hosting-your-own-runners


```yaml
# https://github.com/actions/setup-python#using-setup-python-with-a-self-hosted-runner

name: Python sample
on: [ push ]
jobs:
  build:
    runs-on: [self-hosted, linux, x64]
    name: Python sample
    steps:
    - uses: actions/checkout@v2
    - uses: actions/setup-python@v2
      with:
        python-version: '3.x' # Version range or exact version of a Python version to use, using SemVer's version range syntax
        architecture: 'x64' # optional x64 or x86. Defaults to x64 if not specified
    - run: python3 -c 'print("Hello Self-Hosted GitHub Runner!")'
```

2020.12.31
