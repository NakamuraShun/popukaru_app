# FROM：使用するイメージ、バージョン
FROM ruby:3.1
# 公式→https://hub.docker.com/_/ruby

# Rails 7ではWebpackerが標準では組み込まれなくなったので、yarnやnodejsのインストールが不要

# ruby3.1のイメージがBundler version 2.3.7で失敗するので、gemのバージョンを追記
ARG RUBYGEMS_VERSION=3.3.20

# RUN：任意のコマンド実行
RUN mkdir /popukaru_app

# WORKDIR：作業ディレクトリを指定
WORKDIR /popukaru_app

# COPY：コピー元とコピー先を指定
# ローカルのGemfileをコンテナ内の/popukaru_app/Gemfileに
COPY Gemfile /popukaru_app/Gemfile
COPY Gemfile.lock /popukaru_app/Gemfile.lock

# RubyGemsをアップデート
RUN gem update --system ${RUBYGEMS_VERSION} && \
    bundle install

# ruby-vipsを使用するためlibvips42をインストール
RUN apt-get update -qq && apt-get install -y --no-install-recommends nodejs postgresql-client libvips42

# ローカルのpopukaru_app配下のファイルをコンテナ内のpopukaru_app配下にコピー
COPY . /popukaru_app