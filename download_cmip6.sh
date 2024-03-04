#!/bin/bash

# list all data files
RSYNC_PASSWORD=useatyourownrisk rsync -vrlpt cmip6ng@atmos.ethz.ch::cmip6-ng > /tmp/cmip_file_list.txt

# select the required files (append to file)
cat cmip_file_list.txt | grep "r1i1p1f1_native" | grep "CESM2_historical" | grep "pr_day" > download_list.txt
cat cmip_file_list.txt | grep "r1i1p1f1_native" | grep "CESM2_historical" | grep "tas_day" >> download_list.txt

SYNC_PASSWORD=useatyourownrisk rsync -vrlpt --files-from=download_list.txt cmip6ng@atmos.ethz.ch::cmip6-ng cmip6-ng
