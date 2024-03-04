# Small script to download CMIP6ng data

This is a small script to download CMIP6ng data using a particular (grep) filter.

The focus will be on daily values of the below variables:

- pr (precip)
- tas (surface air temperature)
- rlds / rsds (long wave and shortwave downwelling radiation)
- trans (transpiration)
- evspsbl (evaporation)

Adjust the `grep` filters to expand or limit the downloaded data to particular models, runs, and variables.

Data are appended to a download list, which is then used to grab only the selected files.

When calling the script using:
```
chmod +x download_cmip6.sh
./download_cmip6.sh
```

data will be downloaded in the current directory, make sure that enough disk space is available at this location.
