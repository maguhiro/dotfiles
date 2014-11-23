#!/bin/bash

# シンボリックリンクをはるファイル、ディレクトリのリスト
SYMLINK_LIST="
zshrc
"

# セットアップスクリプトがあるパスの取得
BASE_DIR=$(cd $(dirname $0);pwd)
cd $BASE_DIR

# リストの分だけ繰り返してシンボリックリンクをはる
for FILE in $SYMLINK_LIST; do
  rm -fr ~/.$FILE
  ln -s $BASE_DIR/$FILE ~/.$FILE
done
