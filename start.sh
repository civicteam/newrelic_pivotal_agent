#!/bin/bash


# Convert config template (.yml.tml) into real config (.yml) inserting ENV vars (license key and management api url)
confd -onetime -backend env

# Start the plugin
exec ./pivotal_agent