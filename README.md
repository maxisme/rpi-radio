# Install 433 utils
```
git clone --recursive git://github.com/ninjablocks/433Utils.git
cd 433Utils/RPi_utils
make all
```

# Install wiring
```
apt install wiringpi
```

# Find remote codes
```
./RFSniffer
```
with codes run:
`bash run.sh *code*`

# Install [Homebridge](https://github.com/homebridge/homebridge/wiki/Install-Homebridge-on-Raspbian#installing-homebridge)
```
# setup repo
curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -

# install Node.js
sudo apt-get install -y nodejs gcc g++ make python

# test node is working
node -v

# upgrade npm (version 6.13.4 has issues with git dependencies)
sudo npm install -g npm

sudo npm install -g --unsafe-perm homebridge homebridge-config-ui-x
sudo hb-service install --user homebridge
```

go to `http://<ip address of your server>:8581` `hostname -I`

add both Homebridge Alexa and Homebridge Script2:
```
{
    "bridge": {
        "name": "Homebridge 3DD6",
        "username": "0E:C5:69:45:3D:D6",
        "port": 51132,
        "pin": "309-24-237"
    },
    "accessories": [
        {
            "accessory": "Script2",
            "name": "Lights",
            "on": "/root/plugs/on.sh",
            "off": "/root/plugs/off.sh",
            "fileState": "/root/plugs/state",
            "on_value": "true",
            "unique_serial": "1234567"
        }
    ],
    "platforms": [
        {
            "name": "Config",
            "port": 8581,
            "platform": "config"
        },
        {
            "name": "Alexa",
            "username": "",
            "password": "",
            "pin": "309-24-237",
            "platform": "Alexa"
        }
    ]
}
```


