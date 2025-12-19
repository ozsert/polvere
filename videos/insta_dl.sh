#!/bin/bash

# 🔹 Kullanım: ./insta_dl.sh <Instagram_Post/Reel_URL>
# Örnek: ./insta_dl.sh https://www.instagram.com/reel/DO3um9ODDTa/

URL="$1"

if [ -z "$URL" ]; then
  echo "⚠️  Lütfen bir Instagram post/reel URL'si girin."
  exit 1
fi

# 1️⃣ Videoyu indir
yt-dlp -f "bestvideo+bestaudio" --merge-output-format mkv -o "%(uploader)s [%(id)s].mkv" "$URL"

# 2️⃣ Dosya adını otomatik al
FILENAME=$(yt-dlp --get-filename -o "%(uploader)s [%(id)s].mkv" "$URL")

# 3️⃣ QuickTime uyumlu MP4'e dönüştür
echo "🎬 Dönüştürülüyor: $FILENAME → ${FILENAME%.mkv}.mp4"
ffmpeg -y -i "$FILENAME" -c:v libx264 -c:a aac "${FILENAME%.mkv}.mp4"

# 4️⃣ Orijinal .mkv'yi silmek istersen alttaki satırın yorumunu kaldır
# rm "$FILENAME"

echo "✅ İşlem tamamlandı: ${FILENAME%.mkv}.mp4"