# Minecraft-shell
## 安定版コミット： [commit-4c65a85](https://github.com/s0baco/Minecraft-shell/commit/4c65a8557871da26b86ff348e8cda1406ff190a1)
-----
Minecraft用シェルスクリプトです。  

Vanilla鯖でもバックアップ求められたのでバックアップシェルも作ってます。  
適当にcronで定期的に実行すれば大丈夫だと思います。  

サーバーのファイル名やバックアップディレクトリ等はminecraft.confに記述するようになっています。
適切なファイル名やディレクトリを指定してください。

## 前提
* screen
* Minecraft server
  - Minecraft Forge (Universal)
  - Bukkit (Spigot etc.)
  - Cauldron (MCPC+ ?)

## 導入方法

**git clone する。**
```bash
$ git clone https://github.com/s0baco/Minecraft-shell.git
```

## 使い方
```bash
## 1. git cloneしたMinecraft-shellへ移動する。
$ cd Minecraft-shell

## 2. 実行可能にする。
$ chmod +x minecraft.sh

## 3. サーバーのjarファイルをダウンロードする。
# 以下のサンプルではVer.1.8.1を置いています。
$ wget https://s3.amazonaws.com/Minecraft.Download/versions/1.8.1/minecraft_server.1.8.1.jar

## 4. とりあえず起動します。
$ ./minecraft.sh start

## 5. eula.txt を書き換えます。
# 初回起動時のみ必要です。一度書き換えたら今後不要な手順になります。
$ echo eula=true >> eula.txt

## 6-7. 設定ファイルを書き換えます。
$ vi server.properties
$ vi minecraft.conf

## 8. 今度こそサーバーを起動します。
$
$ ./minecraft.sh start

## 9. サーバーを停止します。
# stop では、カウントダウンがありますが、 killではカウントダウンがありません。
$ ./minecraft.sh stop
```
## 他の機能
```bash
## ex-1. バックアップする
# あらかじめ minecraft.conf の 変数、$BACKUP_DIR をワールドのディレクトリに書き換えます。
# 作者(@s0baco) は絶対パスで記述しています。相対パスでの動作はわからないです・・・。
$ vi minecraft.conf

# スクリプトを叩く
$ ./minecraft.sh backup

## ex-2. シンボリックリンクを使う 
# 起動
$ ./minecraft-start

# 終了 (カウントダウン有)
$ ./minecraft-stop

# 終了 (カウントダウン無)
$ ./minecraft-kill

# 再起動
$ ./minecraft-restart

# バックアップ
$ ./minecraft-backup

## ex-3. サーバーディレクトリの名前を変える
# Minecraft-shell の親ディレクトリに移動します。
$ cd ../

# mv でディレクトリ名を変更します。
$ mv Minecraft-shell {directory_name}
```
## その他
どのMinecraftのサーバー環境でも、  
サーバー自体のjarファイルの名前をminecraft.confに記述すれば使えるはずです。  

## 作者
[@s0baco](http://twitter.com/s0baco)

## ライセンス
MIT Licenseです。

-----
Copyright &copy; 2015 s0baco  
Licensed under the [MIT License][MIT]
[MIT]: http://www.opensource.org/licenses/mit-license.php
