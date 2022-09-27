# smartmontools

!!! Please note that the use of build procedure and VIB is absolutely unsupported. Use at your own risk !!!\
The package has been tested on 6.5.0 Update 3

## About

Docker file to build smartmontools images with all required dependencies.

## Instructions

### Build smartmontools

1. Build docker image `smartmontools-build` with executing `build-docker-image.sh` located in the folder `docker-build`.
2. Start container created from `smartmontools-build` image with docker-compose. Example of such docker compose `yaml` file:
    ```
    version: '3'
    services:

        ubuntu:
          image: smartmontools-build
          container_name: ubuntu
          volumes:
            - linux-data:/home/dist

    volumes:
        linux-data:
    ```
3. Open CLI into container
4. execute:
  - `bash build-svn-smartmoontools.sh` (to build smartmoontools release from svn repository)
  - `bash build-git-smartmoontools.sh` (to build smartmoontools release from git repository)
5. Created `smartctl` (part of smartmoontools) will be archived into docker persisten volume `linux-data` mounted into /home/dist.
6. Download archived `smartctl` located in docker volume `linux-data`.

### Build and install vib package for ESXi

1. Donwnload and install ESXi Community Packaging Tools (ESXi-CPT) http://ESXi-CPT.v-front.de.
2. Create tgz archive with `smartctl` binary.
3. Create vib package.\
![Create vib package with ESXi-CPT-v2.4](https://github.com/mahalozan/smartmontools/blob/master/ESXi-CPT-v2.4.png)
4. Upload vib package `smartctl-<version>.x86_64.vib` to /tmp/ directory of an ESXi host.
5. SSH to the ESXi host.
6. Set the VIB acceptance level to CommunitySupported
```
# esxcli software acceptance set --level=CommunitySupported
```
7. Install the package (Maintenance Mode or Reboot is not required)
```
# esxcli software vib install -v /tmp/smartctl-<version>.x86_64.vib
```


## Links

- https://www.virten.net/2016/05/determine-tbw-from-ssds-with-s-m-a-r-t-values-in-esxi-smartctl/
- smartmontools: https://www.smartmontools.org/wiki/Download
- ESXi Community Packaging Tools: http://ESXi-CPT.v-front.de
