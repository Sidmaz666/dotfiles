#!/bin/bash

PID_ID="$(cat /tmp/batterynotif.pid | head -n1)"

kill $PID_ID
