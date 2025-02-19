#!/bin/bash
VERSION=$1
if [ -x $VERSION ]; then
    echo "ERROR: You must specify a provider version"
    exit
fi

pact-verifier \
  --provider-base-url=http://localhost:3001 \
  --provider-states-setup-url=http://localhost:3001/_pact/provider_states \
  --pact-url=http://127.0.0.1/pacts/provider/Provider/consumer/Consumer/latest \
  --provider-app-version $VERSION \
  --pact-broker-username pactbroker \
  --pact-broker-password pactbroker \
  --publish-verification-results
