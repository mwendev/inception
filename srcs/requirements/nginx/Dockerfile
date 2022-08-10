FROM	debian:buster

RUN		apt-get update && apt-get install -y openssl nginx

RUN		mkdir /etc/nginx/ssl
# Generate a self-signed certificate
RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
		-out /etc/nginx/ssl/mwen.pem \
		-keyout /etc/nginx/ssl/mwen.key \
		-subj "/C=DE/ST=Berlin/L=Berlin/O=42/OU=Wolfsburg/CN=mwen/"

# Configure nginx
COPY	./conf/nginx.conf /etc/nginx/conf.d/default.conf

# Start nginx with PID1
CMD ["nginx", "-g", "daemon off;"]