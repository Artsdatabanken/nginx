FROM jwilder/nginx-proxy
RUN groupadd --gid 1007 dockerrunner && \
	useradd -r --uid 1007 -g dockerrunner dockerrunner
RUN chown -R :dockerrunner /etc/nginx
RUN chown -R :dockerrunner /etc/nginx/dhparam
RUN chmod g+s /etc/nginx
RUN chmod g+s /etc/nginx/dhparam
RUN chown -R :dockerrunner /app
USER dockerrunner