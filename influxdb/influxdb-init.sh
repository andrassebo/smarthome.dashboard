#!/bin/bash
curl -i -XPOST http://localhost:8086/query --data-urlencode "q=CREATE DATABASE collectd"
curl -i -XPOST http://localhost:8086/query --data-urlencode "q=CREATE DATABASE cadvisor"

# set retention policies
 curl -i -XPOST http://localhost:8086/query --data-urlencode "q=CREATE RETENTION POLICY "one_week_only" ON "collectd" DURATION 1w REPLICATION 1 DEFAULT"
 curl -i -XPOST http://localhost:8086/query --data-urlencode "q=CREATE RETENTION POLICY "one_week_only" ON "cadvisor" DURATION 1w REPLICATION 1 DEFAULT"
