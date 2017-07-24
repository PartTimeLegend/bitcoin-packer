#!/usr/bin/env bash
wget https://bitcoin.org/bin/bitcoin-core-0.14.2/bitcoin-0.14.2-x86_64-linux-gnu.tar.gz
tar -xvzf bitcoin-0.14.2-x86_64-linux-gnu.tar.gz
cd bitcoin-0.14.2
cd bin
ls
sudo cp bitcoind /usr/bin/bitcoind
sudo cp bitcoin-cli /usr/bin/bitcoin-cli
sudo cp bitcoin-qt /usr/bin/bitcoin-qt
sudo cp bitcoin-qt /usr/bin/bitcoin-qt
sudo cp bitcoin-qt /usr/bin/bitcoin-qt
ls -ld /usr/bin/[bitcoin]* | grep ^- | tr -s ' ' | cut -d' ' -f9
