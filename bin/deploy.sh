#!/usr/bin/env bash

UNIXTIME=$(date +%s)

docker build -f Dockerfile.prod -t repo.treescale.com/skoba/villahelena:build-$UNIXTIME .
docker push repo.treescale.com/skoba/villahelena:build-$UNIXTIME

helm upgrade -i --set image.tag=build-$UNIXTIME --wait --namespace default villahelena ./chart
WEB_POD=$(kubectl get pods -l app.kubernetes.io/name=villahelena-web --output=jsonpath={.items..metadata.name})
kubectl exec $WEB_POD bundle exec rails db:migrate