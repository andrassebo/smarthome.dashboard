# install collectd
apt-get update && apt-get install -y collectd collectd-utils curl wget && apt-get clean

# copy preconfigured collectd.conf
cp collectd/collectd.conf /etc/collectd/collectd.conf
service collectd restart

# start docker containers
docker-compose up -d

# configure influxdb for collectd
influxdb/influxdb-init.sh

# create grafana dashboard
curl -XPOST -i http://localhost:3000/api/dashboards/db --data-binary @./grafana/pi-dashboard.json -H "Content-Type: application/json"
