# Eero Client Docker

This is a Docker image that allows you to run [343max/eero-client](https://github.com/343max/eero-client.git) with a single command.

## Usage

```bash
docker run --rm -it -v eero-client-data:/data jtmotox/eero-client <command>
```

Substitute ```<command>``` with any of the eero-client commands.

Examples:
- --help
- devices

*Note: It will prompt for authentication the first time you run it.*
