FROM jwilder/nginx-proxy
RUN groupadd --gid 1007 dockerrunner && \
	useradd -r --uid 1007 -g dockerrunner dockerrunner
RUN chmod +x /app/generate-dhparam.sh
RUN cp /app/dhparam.pem.default /etc/nginx/dhparam/dhparam.pem
RUN chown -R :dockerrunner /etc/nginx
RUN ls -l /etc/nginx/dhparam/
USER dockerrunner