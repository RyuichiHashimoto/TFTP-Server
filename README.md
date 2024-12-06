# TFTP Server with Docker

This project sets up a simple TFTP server using Docker and Docker Compose. The server is based on `tftpd-hpa` and exposes TFTP functionality for file transfers.

## Features

- Lightweight TFTP server based on `tftpd-hpa`.
- Configurable root directory for TFTP file storage.
- Easy to deploy using Docker and Docker Compose.

## Prerequisites

- Docker installed on your system.
- Docker Compose installed.

## Directory Structure

```
project-directory/
├── docker-compose.yml
├── Dockerfile
├── tftpd-hpa.conf (optional)
└── tftp_root/      # Directory to store files for TFTP
```

## Setup Instructions

1. **Clone the repository or set up the files manually.**

2. **Prepare the TFTP root directory:**
   - Create a folder named `tftp_root` in the project directory.
   - Place any files you want to make available via TFTP in this folder.

3. **Build and run the Docker container:**
   ```bash
   docker-compose up --build -d
   ```

4. **Access the TFTP server:**
   - Use a TFTP client to connect to the server.
   - Example command to retrieve a file:
     ```bash
     tftp <server_ip>
     tftp> get <filename>
     ```

## Configuration

- **Port:** The server runs on UDP port `69`. Make sure this port is open on your host.
- **Root Directory:** The TFTP server root is mapped to the `tftp_root` directory in the project.
- **Optional Configuration:** You can customize the server using the `tftpd-hpa.conf` file.

## Files

- **`docker-compose.yml`**: Defines the Docker Compose configuration for the TFTP server.
- **`Dockerfile`**: Specifies the base image and dependencies for the TFTP server.
- **`tftpd-hpa.conf`** (optional): Configuration file for `tftpd-hpa`. If not provided, default settings will be used.

## Example Use Case

1. Place `example.txt` in the `tftp_root` directory.
2. Start the server with `docker-compose up`.
3. Use a TFTP client to retrieve the file:
   ```bash
   tftp <server_ip>
   tftp> get example.txt
   ```

## Troubleshooting

- **Permission Issues:** Ensure that the `tftp_root` directory has appropriate permissions. You can set permissions as follows:
  ```bash
  chmod -R 777 tftp_root
  ```
- **Firewall Configuration:** Ensure UDP port `69` is open on your host.

## Stopping the Server

To stop the server, run:
```bash
docker-compose down
```

## License

This project is released under the MIT License.

