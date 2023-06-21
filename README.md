# Eero Client Docker

This is a lightweight (~20mb compressed) Docker image that allows you to run [343max/eero-client](https://github.com/343max/eero-client.git) with a single command.

## Usage

```bash
docker run --rm -it -v eero-client-data:/data jtmotox/eero-client <command>
```

Substitute ```<command>``` with any of the eero-client commands.

Examples:
- --help
- devices

*Note: It will prompt for authentication the first time you run it.*

## Example

Here is a sample project where you can see how this Docker image can be used:\
[JtMotoX/eero-monitor](https://github.com/JtMotoX/eero-monitor)
