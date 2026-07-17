FROM dhi.io/mysql:lts-debian13

# Copy Certificate
RUN mkdir -p /etc/mysql/certs/
COPY --chown=65532:65532 ca.pem /etc/mysql/certs/
COPY --chown=65532:65532 server-cert.pem /etc/mysql/certs/
COPY --chown=65532:65532 server-key.pem /etc/mysql/certs/

# Copy my.cnf
COPY --chown=65532:65532 my.cnf /etc/my.cnf

EXPOSE 3306 33060

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
