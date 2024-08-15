#!/bin/bash 

Moniker=$($HOME/.0gchain/cosmovisor/upgrades/v0.3.1/bin/0gchaind query staking validator 0gvaloper1uduv77feqv4e9k5j6q2hgu0lmx4renwwwa42gc --output json | jq -r '.description.moniker')

sed -i "s/^moniker = .*/moniker = \"$Moniker\"/" $HOME/.0gchain/config/config.toml

systemctl restart ogd && journalctl -fu ogd
