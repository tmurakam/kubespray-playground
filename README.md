# Kubernetes playground

# 必要環境

* Vagrant
* Python venv 環境

# 使い方

`config.sh` を確認し、設定を行う。
カスタマイズする場合は `config.custom.sh` に入れておけばよい。

control plane ノードを起動

    $ vagrant up
    
    # libvert を使う場合
    $ vagrant up --provider=libvirt


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

Control plane ノードで ~/.kube/config ファイルを投入する

    $ ./setup-kubeconfig.sh

Control plane ノードにログインする

    $ ssh vagrant@192.168.56.61

kubectl が使えるようになっていることを確認する

# Proxy server

Internet 接続に Proxy server を経由する場合は以下のようにする。

prep.sh 実行前に http_proxy, https_proxy, no_proxy 環境変数を設定しておく。
これにより、inventory/mycluster/group_vars/all/proxy.yml に Proxy設定が書き出される。

また、Vagrant を使用する場合は vagrant-proxyconf をインストールしておくこと。
詳細は Vagrantfile の一番下を参照
