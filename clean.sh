docker rm -f smarthome.dashboard.influxsrv
docker rm -f smarthome.dashboard.grafana

docker volume rm smarthomedashboard_grafana-data
docker volume rm smarthomedashboard_influxdb-data
docker network rm smarthomedashboard_smarthome-network
