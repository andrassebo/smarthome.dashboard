# install collectd
apt-get update && apt-get install -y collectd collectd-utils curl wget hddtemp lm-sensors && apt-get clean

# copy preconfigured collectd.conf
cp collectd/collectd.conf /etc/collectd/collectd.conf
service collectd restart

# start docker containers
docker-compose -f docker-compose-amd64.yaml up -d

# configure collectd and influxdb
collectd/collectd-init.sh

#create org and token
curl -X POST -H "Content-Type: application/json" -d '{"name":"andrassebo.com"}' http://admin:admin@localhost:3000/api/orgs
curl -X POST http://admin:admin@localhost:3000/api/user/using/2
curl -X POST -H "Content-Type: application/json" -d '{"name":"apikeycurl", "role": "Admin"}' http://admin:admin@localhost:3000/api/auth/keys


# create grafana dashboard
curl -XPOST --insecure -H "Authorization: Bearer eyJrIjoiR0ZXZmt1UFc0OEpIOGN5RWdUalBJTllUTk83VlhtVGwiLCJuIjoiYXBpa2V5Y3VybCIsImlkIjo2fQ==" -i http://localhost:3000/api/dashboards/db --data-binary @./grafana/computer-dashboard.json -H "Content-Type: application/json"
