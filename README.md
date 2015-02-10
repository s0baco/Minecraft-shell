# Minecraft-shell
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

## 使い方
1. minecraft-server.{version}.jar 等、サーバーの実行ファイルがあるディレクトリに移動します。
2. git clone する。
3. minecraft.conf の変数を書き換えます。
4. minecraft-start.sh を実行するとサーバーを起動します。
5. minecraft-stop.sh を実行するとサーバーを終了します。
6. minecraft-backup.sh を実行すると指定ディレクトリをバックアップします。

## その他
Minecraft Forgeを使ったMOD鯖でも、minecraft.conf内 SERVER_NAME を書き換えることで使えます。  
おそらく他の環境 (Bukkit, Spigot, Cauldron, Glowstone?, Sponge? etc..) でも使えると思います。

## 作者
[@s0baco](http://twitter.com/s0baco)

## ライセンス
MIT Licenseです。

-----
Copyright &copy; 2015 s0baco  
Licensed under the [MIT License][MIT]
[MIT]: http://www.opensource.org/licenses/mit-license.php
