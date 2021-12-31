# eero-client-docker

## Build:
```
docker build -t eero-client:latest .
```

## Run:
```
docker run --rm -it --volume eero-client-data:/data eero-client:latest devices
```
