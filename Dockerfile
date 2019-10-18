FROM jwilder/nginx-proxy
RUN groupadd --gid 1007 dockerrunner && \
	useradd -r --uid 1007 -g dockerrunner dockerrunner
RUN chown -R -v :dockerrunner /etc/nginx
RUN chown -R -v :dockerrunner /etc/nginx/dhparam
RUN chmod -R -v g+s /etc/nginx
RUN chmod -R -v g+s /etc/nginx/dhparam
RUN chown -R -v :dockerrunner /app