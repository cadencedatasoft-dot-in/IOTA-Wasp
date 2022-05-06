# Single node IOTA WASP - Just run the script
This script frees up QA/Developers from the task of setting up, configuring, preparing and running WASP node.

### Ubuntu users use: runwaspnode.sh 
### Mac users use: runwaspnodemac.sh 


# Features
 - Automatically install and run wasp node.
 - Creates seed, configures wasp-cli.json and config.json files
 - Starts Wasp node
 - Launches browser to connect with the running WASP node

# Prerequisites
This plugin expects the following packages are already installed on your machine.
 - git
 - build-essentials
 - go
 - rust toolchain
 - node
 
 This document is for reference only, prefer to read runwaspnode.sh or runwaspnodemac.sh file

 ----------
 

//Getting wasp node working with external goshimmer node - run following steps in Ubuntu terminal
git clone --branch v0.2.5 https://github.com/iotaledger/wasp.git
cd wasp
make
// If make returns following error 

// go build -o . -tags rocksdb,builtin_static -ldflags "-X github.com/iotaledger/wasp/packages/wasp.VersionHash=40e3da13cd7c5d076a89a986c3ea78bd65551052" ./...
// # github.com/lucas-clemente/quic-go/internal/qtls
// /home/anand/go/pkg/mod/github.com/lucas-clemente/quic-go@v0.23.0/internal/qtls/go118.go:5:13: cannot use "quic-go doesn't build on Go 1.18 yet." (untyped string constant) as int value in 
// variable declaration
// make: *** [Makefile:15: build] Error 2

go get github.com/lucas-clemente/quic-go@v0.26.0
make

// If make returns following error 
// go build -o . -tags rocksdb,builtin_static -ldflags "-X github.com/iotaledger/wasp/packages/wasp.VersionHash=40e3da13cd7c5d076a89a986c3ea78bd65551052" ./...
// golangci-lint run
// ERRO Can't read config: can't read viper config: open /mnt/60114826-61c3-4ad9-af5c-40136414e188/Projects/CDS/IOTA-Projects/iota-infra/wasp/.golangci.yml: permission denied 
// make: *** [Makefile:38: lint] Error 3

// The above error can be ignored - be sure to check that binaries have been built

./wasp-cli init
./wasp-cli set goshimmer.api https://api.goshimmer.sc.iota.org
./wasp-cli set wasp.0.api 127.0.0.1:9090
./wasp-cli set wasp.0.nanomsg 127.0.0.1:5550
./wasp-cli set wasp.0.peering 127.0.0.1:4000
// ## You can add as many nodes as you like in your committee

//Start node
./wasp


//In a separate terminal run command
./wasp-cli request-funds
