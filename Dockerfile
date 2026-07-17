FROM dhi.io/dhi.io/mysql:lts-debian13

# Copy custom my.conf
COPY --chown=65532:65532 my.conf /etc/my.conf

EXPOSE 3306 33060

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
