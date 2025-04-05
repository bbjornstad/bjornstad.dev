+++
title = "master-cert.pgp.bjornstad.dev"
description = "Personal PGP Keys | master-cert"
date = 2023-12-01
template = "pgp-entry.html"

[extra]
[extra.securitykeys]
id = "primary-dev"
type = "Yubikey 5 NFC"
profile = "USB A"
id_full = "pgp_ybkyA-master-cert"
+++

{{ pgpinline(file_path="content/pgp/master-cert/pgp_ybkyA-master-cert.pub") }}

It is unlikely you will need this key unless you have need to verify the
certifications of one of my other keys. You probably won't even need it then,
since the `primary-dev` key has maintained its certification capabilities for
intermediate keys if needed.

This set of keys was generated directly on the Yubikey, attached to a machine
with **no networking enabled**. Maintenance is performed as needed, attached to
a machine with **no networking enabled**
