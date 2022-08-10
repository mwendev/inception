FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
        nginx \
        openssl

RUN		mkdir /etc/nginx/ssl
# Generate a self-signed certificate
RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
		-out /etc/nginx/ssl/mwen.pem \
		-keyout /etc/nginx/ssl/mwen.key \
		-subj "/C=DE/ST=Berlin/L=Berlin/O=42/OU=Wolfsburg/CN=mwen/"

# Configure nginx
RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

# Start nginx with PID1
CMD ["nginx", "-g", "daemon off;"]