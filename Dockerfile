FROM jwilder/nginx-proxy
RUN groupadd --gid 1007 dockerrunner && \
	useradd -r --uid 1007 -g dockerrunner dockerrunner
RUN chmod -R :1007 /etc/nginx
USER 1007