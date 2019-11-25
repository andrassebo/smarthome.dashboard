#!/bin/bash
curl -i -XPOST http://localhost:8086/query --data-urlencode "q=CREATE DATABASE collectd"

# set retention policies
curl -i -XPOST http://localhost:8086/query --data-urlencode "q=CREATE RETENTION POLICY "four_weeks_only" ON "collectd" DURATION 4w REPLICATION 1 DEFAULT"
