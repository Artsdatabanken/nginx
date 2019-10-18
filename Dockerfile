FROM jwilder/nginx-proxy
RUN groupadd --gid 1007 dockerrunner && \
	useradd -r --uid 1007 -g dockerrunner dockerrunner
RUN mkdir /app/dhparam
RUN mv /app/dhparam /etc/nginx/dhparam
RUN chown -R -v :dockerrunner /etc/nginx
RUN chown -R -v :dockerrunner /etc/nginx/dhparam
RUN chmod -R -v g+s /etc/nginx
RUN chmod -R -v g+s /etc/nginx/dhparam
RUN chown -R -v :dockerrunner /app
RUN chown :dockerrunner /usr/local/bin/forego
RUN chmod g+rx /usr/local/bin/forego
RUN chown :dockerrunner /var/cache/nginx
RUN chown :dockerrunner /tmp
RUN chmod g+s /tmp
RUN chmod g+rw /var/cache/nginx
RUN chown :dockerrunner /var/run
RUN chmod g+rw /var/run

# Replace 
RUN sed -i -e '/listen/!b' -e '/80;/!b' -e 's/80;/8080;/' /etc/nginx/conf.d/default.conf
RUN sed -i -e '/listen/!b' -e '/80;/!b' -e 's/80;/8080;/' /app/nginx.tmpl
RUN sed -i -e '/listen/!b' -e '/80 /!b' -e 's/80 /8080 /' /app/nginx.tmpl
RUN sed -i -e '/listen/!b' -e '/443 ssl/!b' -e 's/443 ssl/4343 ssl/' /app/nginx.tmpl 
