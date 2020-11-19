#!/bin/bash

apt-get -qq update > /dev/null

apt-get -qq install --assume-yes maven > /dev/null

pushd source

mvn -Dmaven.test.skip.exec -Dhttp.keepAlive=false -Dmaven.wagon.http.pool=false -Dmaven.wagon.http.retryHandler.count=3 package --quiet --batch-mode -T 5

popd

exit 0