#! /bin/sh
#set -x

# SRC変数に変換対象の pdf ファイルのファイル名を設定
SRC="sotsuron.pdf"

if [ ! -z $1 ]; then
  SRC="$1"
fi

# ファイル名に、拡張子 .pdf が付いていれば削除
SRC=`echo "${SRC}"|sed -e 's/.pdf$//'`

PDF=${SRC}.pdf
TXT=${SRC}.txt

GITIGNORE=.gitignore

# tika アプリをダウンロード
TIKA='tika-app-1.22.jar'
TIKA_SRC='http://ftp.jaist.ac.jp/pub/apache/tika/'${TIKA}
if [ ! -e ${TIKA} ]; then
  echo 'downloading tika app ...'
  curl -o ${TIKA} ${TIKA_SRC}
fi

# tika アプリを .gitignore に追加
if  ! grep "${TIKA}" ${GITIGNORE} >/dev/null; then
  echo '' >> ${GITIGNORE}
  echo '# tika app' >> ${GITIGNORE}
  echo ${TIKA} >> ${GITIGNORE}
fi

# tika を使って PDF を txt に変換
echo converting ${PDF} to ${TXT} ...
java -jar ${TIKA} --text ${PDF} > ${TXT} 2>/dev/null

# 変換結果の txt ファイルを .gitignore に追加
if  ! grep "${TXT}" ${GITIGNORE} >/dev/null; then
  echo '' >> ${GITIGNORE}
  echo ${TXT} >> ${GITIGNORE}
fi
