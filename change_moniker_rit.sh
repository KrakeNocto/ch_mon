#!/bin/bash 

read -p "Enter val address: " VAL
Moniker=$(/home/ritual/.0gchain/cosmovisor/upgrades/v0.3.1/bin/0gchaind query staking validator $VAL --output json | jq -r '.description.moniker')

sed -i "s/^moniker = .*/moniker = \"$Moniker\"/" /home/ritual/.0gchain/config/config.toml

echo $Moniker

rm change_moniker_rit.sh
