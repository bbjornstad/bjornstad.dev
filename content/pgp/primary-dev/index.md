+++
title = "primary-dev.pgp.bjornstad.dev"
description = "Personal PGP Keys | primary-dev"
date = 2023-12-31
template = "pgp-entry.html"

[extra]
[extra.securitykeys]
id = "primary-dev"
type = "Yubikey 5 NFC"
profile = "USB A"
id_full = "pgp_ybkyA-primary-dev"
+++

{{ pgpinline(file_path="content/pgp/primary-dev/pgp_ybkyA-primary-dev.pub") }}

This is my primary PGP key for development work and general use. If you want to
encrypt your email to me, this is the one to use. This is also the main PGP key
that I use to sign commits on GitHub.

I have maintained this key's ability to certify external keys, but I don't
intend to use this to certify my own keys outside the most extenuating
circumstances (or self-certification, either automatically or when certifying my
own keys of a comparable or subsumed "security designation", by which I mean, I
would like to certify a particular key for a specific purpose or application
with my `primary-dev` or similar key, to protect the `master-cert` at all
costs).

This set of keys was generated directly on the Yubikey, and is certified with
`master-cert`. These keys are allowed to touch networked devices (it is sort of
the whole point of doing this setup this way).
