# eero-client-docker

## Build:
```
docker build -t eero-client:latest .
```

## Run:
```
docker run --rm -it \
	--name eero-client \
	--volume eero-client-data:/data \
	eero-client:latest devices
```
