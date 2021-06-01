#!/bin/bash

COMPONENT_NAME=$1

echo "Testing component ${COMPONENT_NAME}"

pushd "${COMPONENT_NAME}" || exit
if [[ "$COMPONENT" =~ .*docker-up.* ]]; then
    exit 0
fi

if [[ "$COMPONENT_NAME" == "test" ]]; then
    exit 0
fi

go test -v -coverprofile=coverage.out ./...

popd || exit
