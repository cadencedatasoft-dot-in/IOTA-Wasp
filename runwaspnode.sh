sudo apt-get install jq

# You may change the branch here
git clone --branch v0.2.5 https://github.com/iotaledger/wasp.git
cd wasp
go get github.com/lucas-clemente/quic-go@v0.26.0
echo "Building wasp..., this may take some time"
make &>/dev/null
./wasp-cli init
./wasp-cli set goshimmer.api https://api.goshimmer.sc.iota.org
./wasp-cli set wasp.0.api 127.0.0.1:9090
./wasp-cli set wasp.0.nanomsg 127.0.0.1:5550
./wasp-cli set wasp.0.peering 127.0.0.1:4000

jq '.nodeconn.address = "goshimmer.sc.iota.org:5000"' config.json > tmp.$$.json && mv tmp.$$.json config.json

# Start wasp node in new tab
gnome-terminal --tab -- ./wasp


# Wait and request for funds 
sleep 30s
./wasp-cli request-funds
