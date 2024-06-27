#!/bin/env bash
version=$1
output=/tmp/$$
node_port=$(kubectl get service -n consul api-gateway -o=jsonpath='{.spec.ports[0].nodePort}')
for i in $(seq 1 100); do
    curl -s "http://localhost:${node_port}/?version=${version}" | grep h1 | tee -a $output
done

echo "################"
echo "#  summary     #"
echo "################"
cat $output | sort | uniq -c
rm $output
