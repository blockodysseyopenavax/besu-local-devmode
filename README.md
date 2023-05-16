# Besu Local Devmode

Run besu local node in devmode via docker.

## Requirements

- curl
- docker

## Usage

### Run the node

1. Start the node _besu-dev_ by `docker compose up`.

2. Check if node is working using curl:

   ```Bash
   curl localhost:8545 -XPOST -d '{"jsonrpc":"2.0","id":1,"method":"eth_blockNumber"}'
   ```

   Or use foundry's cast:

   ```Bash
   cast rpc eth_blockNumber
   ```

3. Clean up by `docker compose down`.

### Persist node's state

1. Create docker volume _besu-dev-database_ by `sh create-volume.sh`.

2. Remove the comments in docker-compose.yaml and run node by `docker compose up`.

3. To clean up the volume, run

   ```Bash
   docker volume rm besu-dev-database
   ```

   after `docker compose down`.
