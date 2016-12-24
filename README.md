# docker-compose-dev
開発環境構築を Docker Compose を使って手軽に作成するためのものです。
## できること
* PHP 7.1
* MySQL 5.7
* memcached 1.4

を使った開発環境の構築
## 使い方
### 開発環境の作成
```
git clone https://github.com/IkezoeMakoto/docker-compose-dev
cd docker-compose-dev
docker-compose up -d
```

上記コマンドを実行することで
* web : php7.1:apache コンテナ
* db : mysql5.7 コンテナ
* memcached : memcached1.4 コンテナ
* composer : composer コンテナ
* npm : npm コンテナ

のコンテナが作成されます。

### composer or npm コマンドの実行
```
# composer で cakephp アプリ作る場合
docker-compose run --rm composer create-project --prefer-dist cakephp/app myapp
# npm コマンド
docker-compose run --rm npm install
```
上記コマンドを実行することで composer, npm 実行用コンテナが立ち上がります。

### 開発環境の停止, 開始
開発環境を停止, 開始する方法は以下の通りです。
使用しない時は停止しておきましょう。
```
cd docker-compose-dev
# 停止
docker-compose stop
docker ps -a
---
CONTAINER ID        IMAGE                        COMMAND                  CREATED             STATUS                      PORTS               NAMES
46b281982b04        dockercomposedev_composer    "composer --help"        51 minutes ago      Exited (0) 51 minutes ago                       composer
62bc3f2eacd4        dockercomposedev_web         "apache2-foreground"     51 minutes ago      Exited (0) 8 seconds ago                        web
d717fdc92af9        dockercomposedev_data        "sh"                     51 minutes ago      Exited (0) 51 minutes ago                       data
1b510235dbcb        dockercomposedev_memcached   "docker-entrypoint.sh"   51 minutes ago      Exited (0) 7 seconds ago                        memcached
---
# 開始
docker-compose start
docker ps
---
docker ps -a
CONTAINER ID        IMAGE                        COMMAND                  CREATED             STATUS                      PORTS                                           NAMES
46b281982b04        dockercomposedev_composer    "composer --help"        53 minutes ago      Exited (0) 8 seconds ago                                                    composer
62bc3f2eacd4        dockercomposedev_web         "apache2-foreground"     53 minutes ago      Up 8 seconds                0.0.0.0:10080->80/tcp, 0.0.0.0:10443->443/tcp   web
d717fdc92af9        dockercomposedev_data        "sh"                     53 minutes ago      Exited (0) 10 seconds ago                                                   data
1b510235dbcb        dockercomposedev_memcached   "docker-entrypoint.sh"   53 minutes ago      Up 10 seconds               11211/tcp                                       memcached
ffbc294dea16        dockercomposedev_db          "docker-entrypoint.sh"   53 minutes ago      Up 9 seconds                0.0.0.0:13306->3306/tcp                         db
---
```
### 開発環境の削除
不要になった開発環境は削除しましょう。
```
# 不要コンテナの削除
docker-compose down
```

## 構成
### ファイル構成
ファイル構成は下記の通り。
```
├── LICENSE
├── README.md -> このファイル
├── data -> docker コンテナに使うファイル
│   ├── html -> web アプリケーション用のファイル設置場所
│   │   ├── index.html
│   │   └── test.php -> phpinfo があります。確認用です。
│   └── log -> 未使用。のちのちはログファイルをここに貯めたい。
├── docker -> dockerfile や 設定ファイル置くところ
│   ├── composer -> composer 実行用コンテナ
│   │   └── Dockerfile
│   ├── data -> data 永続化用コンテナ
│   │   └── Dockerfile
│   ├── db -> db 用コンテナ (MySQL)
│   │   └── Dockerfile
│   ├── memcached -> memcached 用コンテナ
│   │   └── Dockerfile
│   ├── npm -> npm 用コンテナ
│   │   └── Dockerfile
│   └── web -> web サーバ用コンテナ
│       └── Dockerfile
└── docker-compose.yml -> compose 用設定ファイル
```

## やり残していること
* log の永続化
* docker registry に登録して image から compose
* MariaDB も選択できるようにする
* コンテナ名、ポートをコマンドラインから指定できるようにする