# Kubernetes playground

# 使い方

`config.sh` を確認し、設定を行う。
カスタマイズする場合は `config.custom.sh` に入れておけばよい。

master, worker ノードを起動

    $ vagrant up

準備を行う

    $ ./prep.sh

prep.sh では以下が行われる。

* Kubespray の入手
* sshキー投入
* Ansible インストール
* inventoryファイル作成

kubespray を実行

    $ ./do-kubespray.sh

Master ノードにログインする

    $ ssh vagrant@192.168.56.61

kubectl 設定ファイルを用意

    $ mkdir ~/.kube
    $ sudo cat /etc/kubernetes/admin.conf > ~/.kube/config

これで kubectl が使えるようになる
