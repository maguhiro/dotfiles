#!/bin/bash

# シンボリックリンクをはるファイル、ディレクトリのリスト
SYMLINK_LIST="
zshrc
"

# セットアップスクリプトがあるパスの取得
BASE_DIR=$(cd $(dirname $0);pwd)
cd $BASE_DIR

# リストの分だけ繰り返してシンボリックリンクをはる
echo "Create: Symbolic Link Dotfile"
for FILE in $SYMLINK_LIST; do
  rm -fr ~/.$FILE
  ln -s $BASE_DIR/$FILE ~/.$FILE
done

# homebrewの設定
if [ `uname` == 'Darwin' ]; then
  # Macの場合
  which brew > /dev/null 2>&1
  if [ $? -eq 1 ]; then
    # homebrewのインストール
    echo "Install: Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  fi

  # 各種ツールのインストール
  echo "Install: Brew Each Tools"
  sudo $BASE_DIR/brew/setup.sh
fi
