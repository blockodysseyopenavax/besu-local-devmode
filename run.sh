docker stop besu-dev
docker run \
  --rm \
  -d \
	-p 8545:8545 \
	-p 8546:8546 \
	--name besu-dev \
	hyperledger/besu \
  --network=dev \
  --rpc-http-enabled \
  --rpc-http-cors-origins=all \
  --rpc-ws-enabled \
  --host-allowlist=* \
  --min-gas-price=0 \
  --miner-enabled \
  --miner-coinbase 0x28fb346214e844775650718c694a83de2e109644
