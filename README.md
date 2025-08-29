# Kubernetes playground

# 必要環境

* Vagrant
* Python venv 環境

# 使い方

`config.sh` を確認し、設定を行う。
カスタマイズする場合は `config.custom.sh` に入れておけばよい。

control plane ノードを起動

    $ vagrant up

準備を行う

    $ ./prep.sh

prep.sh では以下が行われる。

* Kubespray の入手
* sshキー投入
* Ansible インストール
* inventoryファイル作成

Note: Kubespray は config.sh で指定されたバージョンが自動でダウンロード・展開されるが、
展開済みの Kubespray (git clone したものなど)を使いたい場合は、config.sh の
`KUBESPRAY_DIR` でディレクトリを指定すればよい。

kubespray を実行

    $ ./do-kubespray.sh

Control plane ノードにログインする

    $ ssh vagrant@192.168.56.61

kubectl 設定ファイルを用意

    $ mkdir ~/.kube
    $ sudo cat /etc/kubernetes/admin.conf > ~/.kube/config

これで kubectl が使えるようになる
