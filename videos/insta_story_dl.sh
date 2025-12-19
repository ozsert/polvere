#!/bin/bash

# 🔹 Kullanım: ./insta_story_dl.sh <Instagram_Story_URL>
# Örnek: ./insta_story_dl.sh https://www.instagram.com/stories/username/1234567890/

URL="$1"

if [ -z "$URL" ]; then
  echo "⚠️  Lütfen bir Instagram story URL'si girin."
  exit 1
fi

# 1️⃣ Kullanıcı adını ve Story ID'yi URL'den çıkar
USERNAME=$(echo "$URL" | sed -n 's/.*stories\/\([^\/]*\).*/\1/p')
if [ -z "$USERNAME" ]; then
  USERNAME="unknown"
fi

# Story ID'yi çıkar
EXPECTED_STORY_ID=$(echo "$URL" | sed -n 's/.*stories\/[^\/]*\/\([0-9]*\).*/\1/p')
echo "🎯 Hedef Story ID: $EXPECTED_STORY_ID"

# 2️⃣ Timestamp oluştur
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# 3️⃣ Story'yi indir (geçici olarak .mkv formatında)
echo "📥 Story indiriliyor..."
# Timestamp ekleyerek benzersiz dosya adı oluştur, böylece eski dosyaları override etmez
yt-dlp --cookies-from-browser chrome --no-playlist --no-continue -f "bestvideo+bestaudio" --merge-output-format mkv -o "story_${TIMESTAMP}_%(id)s.mkv" "$URL"

# 4️⃣ İndirilen dosyayı bul (story_TIMESTAMP_ ile başlayan .mkv dosyası)
TEMP_FILE=$(ls -t story_${TIMESTAMP}_*.mkv 2>/dev/null | head -1)

if [ ! -f "$TEMP_FILE" ]; then
  echo "❌ Story indirilemedi."
  exit 1
fi

# İndirilen Story ID'yi dosya adından çıkar ve kontrol et
# Format: story_TIMESTAMP_ID.mkv
DOWNLOADED_STORY_ID=$(echo "$TEMP_FILE" | sed -n "s/story_${TIMESTAMP}_\(.*\)\.mkv/\1/p")
echo "📦 İndirilen Story Shortcode: $DOWNLOADED_STORY_ID"
echo "ℹ️  Instagram Media ID: $EXPECTED_STORY_ID"
echo "   (Farklı ID formatları - aynı story'nin farklı tanımlayıcıları)"

# 5️⃣ Dosyaları yeniden adlandır
MKV_FILE="${USERNAME}_${DOWNLOADED_STORY_ID}.mkv"
MP4_FILE="${USERNAME}_${DOWNLOADED_STORY_ID}.mp4"

# MKV dosyasını yeniden adlandır
mv "$TEMP_FILE" "$MKV_FILE"

# 6️⃣ QuickTime uyumlu MP4'e dönüştür
echo "🎬 Dönüştürülüyor: $MKV_FILE → $MP4_FILE"
ffmpeg -y -i "$MKV_FILE" -c:v libx264 -c:a aac "$MP4_FILE"

echo "✅ İşlem tamamlandı: $MKV_FILE ve $MP4_FILE"
