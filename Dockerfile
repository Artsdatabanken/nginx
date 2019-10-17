FROM jwilder/nginx-proxy
RUN groupadd --gid 1007 dockerrunner && \
	useradd -r --uid 1007 -g dockerrunner dockerrunner
RUN chown -R :dockerrunner /etc/nginx
RUN chmod g+s /etc/nginx
RUN chmod g+s /etc/nginx/dhparam
USER dockerrunner