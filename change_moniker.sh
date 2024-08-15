#!/bin/bash 

read -p "Enter val address: " VAL
Moniker=$($HOME/.0gchain/cosmovisor/upgrades/v0.3.1/bin/0gchaind query staking validator $VAL --output json | jq -r '.description.moniker')

sed -i "s/^moniker = .*/moniker = \"$Moniker\"/" $HOME/.0gchain/config/config.toml

systemctl restart ogd && journalctl -fu ogd
