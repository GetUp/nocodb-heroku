FROM nocodb/nocodb:0.204.9

# see https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL.html#UsingWithRDS.SSL.CertificatesDownload
ADD https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem /usr/local/share/ca-certificates/global-bundle.pem

# This command complains about the PEM when it runs, but seems to work anyway
RUN update-ca-certificates

ENTRYPOINT ["sh", "/usr/src/appEntry/start.sh"]
