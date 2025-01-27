FROM nocodb/nocodb:0.260.2

# Can't use the standard update-ca-certificates approach here since
# the RDS CA certs file contains the complete chain of certs, and
# that utility works only with files containing single certificates.
#
# So we need to configure it at the application level, but...
# as of v260, Noco's DB TLS confiuration is *terrrrrible*.
#
# You can either use their proprietary NC_DB format that doesn't let
# you specify TLS settings in any useful way at the moment, or...
#
# You can use DATABASE_URL but as their docs point out this gets
# parsed as a JDBC URL (seriously? a Java DB URL?!), which they parse,
# require non-standard configuration for TLS that is incompatible with
# everything Postgres itself, the Node pg package, and knex (which it
# uses under the good), the re-assemble only partially to pass back
# through to knex.
#
# So as a result, you can't actually pass in any of the TLS settings
# you'd expect from reading the docs for Postgres, pg, or knex, and
# it is only possible to include the RDS CA certs globally by setting
# NODE_EXTRA_CA_CERTS in the end.

ADD 20250127-RDS-global-bundle.pem /usr/local/share/ca-certificates/global-bundle.pem

ENTRYPOINT ["sh", "/usr/src/appEntry/start.sh"]
