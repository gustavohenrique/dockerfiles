### SFTP server

Usage:

```sh
docker run --rm --name sftp -e SFTP_USERS="user:test:1001" -p 2222:22 gustavohenrique/sftp:latest
sftp -oPort=2222 user@127.0.0.1
```
