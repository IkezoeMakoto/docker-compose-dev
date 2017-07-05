FROM mariadb:10.3

RUN apt-get update \
  && apt-get install --no-install-recommends -y tzdata \
  && apt-get clean \

# Timezone設定済みの設定ファイルへ上書き
COPY my.cnf /etc/mysql/my.cnf