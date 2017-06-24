#!/bin/bash

set -xe

/screeps/node_modules/screeps/bin/screeps.js \
--runners_cnt 4 \
--processors_cnt 4 \
start
