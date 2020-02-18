#! /bin/bash
### Script de integracao com o Telegram - Consulta mensagens ### 
#set -x
ENTER="
";
USERID="$1";
ARQUIVO="/usr/local/share/zabbix/alertscripts/botinfo.txt";
if [ -f "$ARQUIVO" ]; then
  KEY=$(cat $ARQUIVO);
else
# Add key bot
  KEY="CHAVE_DO_BOT";
fi
echo $ENTER;
URL="https://api.telegram.org/bot$KEY/getUpdates"

curl -s $URL | grep message | awk -F':' '{print $5","$6","$7","$8}' | sed 's/"//g' | awk -F',' '{print $1","$3" "$5",@"$7}' | sed 's/}//g'

echo $ENTER;