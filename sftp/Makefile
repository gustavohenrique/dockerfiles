build:
	@docker build . -t=gustavohenrique/sftp:latest --network host

test:
	@docker run --rm --name sftp1 -e SFTP_USERS="asap:test:1001" -p 2222:22 gustavohenrique/sftp:latest

deploy:
	@docker push gustavohenrique/sftp:latest
