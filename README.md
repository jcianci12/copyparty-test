# Copyparty Docker Stack

This is a Docker setup for [copyparty](https://github.com/9001/copyparty), a portable file server with accelerated resumable uploads, dedup, WebDAV, FTP, TFTP, zeroconf, media indexer, and thumbnails.

## Quick Start

1. **Clone or download this repository**
   ```bash
   git clone <your-repo-url>
   cd copyparty-test
   ```

2. **Create data directories**
   ```bash
   mkdir -p data logs
   ```

3. **Start the Docker stack**
   ```bash
   docker-compose up -d
   ```

4. **Access copyparty**
   - Web interface: http://localhost:3923
   - The server will serve files from the `./data` directory
   - Files can be uploaded and downloaded with full read/write access

## Configuration

### Port
- Default port: `3923`
- Change in `docker-compose.yml` if needed

### Volumes
- `./data` → `/w` (file share directory with read/write access)

### Environment Variables
You can add more environment variables to the `docker-compose.yml` file for additional copyparty options.

## Copyparty Features

- **File Sharing**: Web-based file browser
- **Upload Support**: Drag & drop file uploads
- **Resumable Uploads**: Continue interrupted uploads
- **Deduplication**: Avoid duplicate files
- **WebDAV Support**: Access via WebDAV clients
- **FTP/TFTP**: Traditional file transfer protocols
- **Media Indexing**: Automatic media file indexing
- **Thumbnails**: Image and video thumbnails
- **Zeroconf**: Automatic network discovery

## Advanced Usage

### Custom Configuration
You can create configuration files in the `./config` directory. The official copyparty Docker image will automatically load configurations from the `/cfg` mount point.

### Additional Options
- `--qr`: Show QR code for easy mobile access
- `--no-browser`: Don't open browser automatically
- `--no-robots`: Disable robots.txt
- `--no-dedup`: Disable deduplication
- `--no-thumb`: Disable thumbnails

## Troubleshooting

### Check logs
```bash
docker-compose logs -f copyparty
```

### Restart service
```bash
docker-compose restart copyparty
```

### Pull latest image and restart
```bash
docker-compose down
docker-compose pull
docker-compose up -d
```

## Security Notes

- This setup binds to all interfaces (`0.0.0.0`)
- For production use, consider adding authentication
- Review copyparty's security documentation for additional hardening

## Links

- [Copyparty GitHub Repository](https://github.com/9001/copyparty)
- [Copyparty Documentation](https://github.com/9001/copyparty?tab=readme-ov-file#quickstart)
