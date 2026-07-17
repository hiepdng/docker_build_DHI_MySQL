FROM dhi.io/mysql:lts-debian13

# Copy custom my.cnf
COPY --chown=65532:65532 my.cnf /etc/my.cnf

EXPOSE 3306 33060

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
