`mkdir -p /mnt/rabbitmq`
`kubectl create ns rabbitmq`

port: `5672:5672`, `15671:15671`

USER : guest
PW : guest

mount path : `/mnt/rabbitmq`

`kubectl apply -f rabbitmq-pv.yaml -n rabbitmq`
`kubectl apply -f rabbitmq-pvc.yaml -n rabbitmq`
`kubectl apply -f statefulset.yaml -n rabbitmq`
