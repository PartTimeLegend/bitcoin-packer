#!/usr/bin/env bash
echo "Downloading bitcoin"
wget https://bitcoin.org/bin/bitcoin-core-0.14.2/bitcoin-0.14.2-x86_64-linux-gnu.tar.gz
tar -xvzf bitcoin-0.14.2-x86_64-linux-gnu.tar.gz
cd bitcoin-0.14.2
cd bin
echo "Listing Contents of extracted bin"
ls
echo "Copying bitcoin binaries to final home."
sudo cp bitcoind /usr/bin/bitcoind
sudo cp bitcoin-cli /usr/bin/bitcoin-cli
sudo cp bitcoin-qt /usr/bin/bitcoin-qt
sudo cp bitcoin-qt /usr/bin/bitcoin-qt
sudo cp bitcoin-qt /usr/bin/bitcoin-qt
echo "Listing bitcoin binaries now in place."
ls -ld /usr/bin/[bitcoin]* | grep ^- | tr -s ' ' | cut -d' ' -f9
echo "Creating systemd Service"
echo "[Unit]" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "Description=Bitcoin's distributed currency daemon" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "After=network.target" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "[Service]" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "User=bitcoin" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "Group=bitcoin" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "Type=forking" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "PIDFile=/var/lib/bitcoind/bitcoind.pid" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "ExecStart=/usr/bin/bitcoind -daemon -pid=/var/lib/bitcoind/bitcoind.pid \" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "-conf=/etc/bitcoin/bitcoin.conf -datadir=/var/lib/bitcoind -disablewallet" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "Restart=always" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "PrivateTmp=true" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "TimeoutStopSec=60s" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "TimeoutStartSec=2s" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "StartLimitInterval=120s" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "StartLimitBurst=5" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "[Install]" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "WantedBy=multi-user.target" | sudo tee --append /usr/lib/systemd/system/bitcoind.service > /dev/null
echo "Enabling systemd Service"
sudo systemctl enable bitcoind
echo "Starting systemd Service"
sudo systemctl start bitcoind
