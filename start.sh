#!/bin/bash
bundle exec rails server -b 0.0.0.0 -p ${PORT:-3000} -e production
