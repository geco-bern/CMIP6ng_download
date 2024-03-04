#!/bin/bash

# list all data files
RSYNC_PASSWORD=useatyourownrisk rsync -vrlpt cmip6ng@atmos.ethz.ch::cmip6-ng > /tmp/cmip_file_list.txt

# select the required files (append to file)
# stack grep commands to filter to the desired level
cat /tmp/cmip_file_list.txt | grep "r1i1p1f1_native" | grep "CESM2_historical" | grep "pr_day" | cut -d' ' -f5 > download_list.txt
cat /tmp/cmip_file_list.txt | grep "r1i1p1f1_native" | grep "CESM2_historical" | grep "tas_day" | cut -d' ' -f5 >> download_list.txt

# download using the temporary list, into the current directory
SYNC_PASSWORD=useatyourownrisk rsync -vrlpt --files-from=download_list.txt cmip6ng@atmos.ethz.ch::cmip6-ng cmip6-ng
