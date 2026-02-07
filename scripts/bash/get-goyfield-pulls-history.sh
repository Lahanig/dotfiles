cd ~/.steam/steam/steamapps/compatdata/*/pfx/drive_c/users/steamuser/AppData/LocalLow/Gryphline/Endfield/sdklogs

token=$(grep -oP 'u8_token=\K[^&|\s]+' "./HGWebview.log" | tail -1)

pull_link="https://ef-webview.gryphline.com/page/gacha_char?pool_id=standard&u8_token="$token"&platform=Windows&channel=6&subChannel=6&lang=ru-ru&server=3" 

echo "$pull_link" | xclip -selection clipboard
echo "$pull_link"
