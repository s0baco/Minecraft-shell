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
1. git clone する。
2. cd Minecraft-shell で Minecraft-shell に移動する。
3. chmod +x *.sh を実行して、実行可能にする。
4. minecraft-server.{version}.jar 等、サーバー.jarを置く。
5. server.properties を書き換えます。
5. minecraft.conf を書き換えます。
6. minecraft-start.sh を実行するとサーバーを起動します。
7. 初回起動時のみ、eula.txt を書き換えて、 eula=true にします。 
8. minecraft-stop.sh を実行するとサーバーを終了します。
9. minecraft-restart.sh を実行するとサーバーを再起動します。
10. minecraft-backup.sh を実行すると指定ディレクトリをバックアップします。
11. cd ../; mv Minecraft-shell {directory_name} でフォルダ名を変えます。

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
