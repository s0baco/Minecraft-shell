# Minecraft-shell
-----
個人的に作ったMinecraft用シェルスクリプトです。
いろいろなところ見て動けばいいやって感じで作ったので適当です・・・。

Vanilla鯖でもバックアップ求められたのでバックアップシェルも作ってます。
適当にcrontabででも定期的に動かしてやってください。

# 前提
Minecraft (server)
screen

# 使い方
1. server.jar のディレクトリに移動します。
2. git cloneとかの手段でこのシェルスクリプトたちを置きます。
3. start, stop, backup シェルの変数を書き換えます。
4. minecraft-start.sh を叩けば鯖を開きます。
5. minecraft-stop.sh を叩けば鯖を閉じます。
6. minecraft-backup.sh を叩けばワールドデータをバックアップできます。
7. minecraft-backup.sh をcronで動かすように設定します。

# ライセンス
MIT Licenseです。
こんなものにライセンスもクソもない気がしますが・・・。

# 作者
@s0baco
