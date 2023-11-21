FROM nocodb/nocodb:0.202.8

ADD https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem /usr/local/share/ca-certificates/rds-combined-ca-bundle.pem

# This command complains about the PEM when it runs, but seems to work anyway
RUN update-ca-certificates

ENTRYPOINT ["sh", "/usr/src/appEntry/start.sh"]
