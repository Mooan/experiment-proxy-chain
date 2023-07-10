# Proxy-Chainの動作確認
BASIC認証がかけられたProxyに対して、Proxy-Chainを構築したい。

以下の２つのプロキシA,BをDockerコンテナ上に実装して、Proxy-Chainが動作するか検証した

- プロキシA:
  - BASIC認証がかけられたプロキシ
  - [Squid Web Cache](http://www.squid-cache.org/)で実装
- プロキシB:
  - プロキシAに対するProxy-Chain
  - node.js + [proxy-chain](https://www.npmjs.com/package/proxy-chain)で実装
    - ドキュメントを読んで、用途が合っていそうだったので、他の候補は検討せずに'proxy-chain'を使って実験する

## 実験
プロキシAとプロキシBのそれぞれをDockerコンテナ上に構築した。
WEBクライアントはcurlを用いた。

### 動作環境
- Ubuntu 22.04
- Linux 5.15.0-71-generic #78-Ubuntu SMP Tue Apr 18 09:00:08 UTC 2023 aarch64 aarch64 aarch64 GNU/Linux
- Docker version 24.0.4, build 3713ee1
- curl 7.81.0 
- Makefile

### 1. プロキシなしでアクセス
```
$make test_no_proxy
```

### 2. プロキシAを経由してアクセス（BASIC認証あり）
```
$ make test_proxy_a
http_proxy=http://abc:123@localhost:3128 curl -vl google.com
* Uses proxy env variable http_proxy == 'http://abc:123@localhost:3128'
```

### 3. プロキシBを経由してアクセス(Proxy-Chain)
```
$ make test_proxy_b
export http_proxy=http://localhost:8080; curl -vl google.com
* Uses proxy env variable http_proxy == 'http://localhost:8080'
```


## 参考リンク
- Squidの設定については以下を参考にした
  - https://sig9.org/archives/4482