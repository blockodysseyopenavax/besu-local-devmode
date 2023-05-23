# Besu Local Devmode

Run besu local node in devmode via docker.

## Getting Started

### Requirements

- docker
- curl

### Usage

1. Start the node _besu-dev_ by

   ```Bash
   docker compose up
   ```

2. Check if node is working using curl:

   ```Bash
   curl localhost:8545 -XPOST -d '{"jsonrpc":"2.0","id":1,"method":"eth_blockNumber"}'
   ```

   Or use foundry's cast:

   ```Bash
   # general rpc
   cast rpc eth_blockNumber

   # blockNumber
   cast block-number
   ```

3. Clean up by

   ```Bash
   docker compose down
   ```

#### Persist node's state

1. Create docker volume _besu-dev-database_ by

   ```Bash
   # ./create-volume.sh
   docker volume create besu-dev-database
   docker run --rm -v besu-dev-database:/opt/besu/database:rw ubuntu /bin/sh -c "useradd besu && chown besu:besu /opt/besu/database"
   ```

2. Remove all comments in `docker-compose.yaml` then run the node.

3. To clean up the volume after shutting down, run

   ```Bash
   docker volume rm besu-dev-database
   ```

#### Get mining reward

Replace `--miner-coinbase` address with yours.
