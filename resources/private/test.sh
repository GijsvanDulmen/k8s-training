#!/bin/bash

# From private namespace to apps namespace without namespace
# result: curl: (6) Could not resolve host: svc-normal
curl http://svc-normal:8080

# From private namespace to apps namespace
# result: 200 OK
curl http://svc-normal.apps:8080

# From apps namespace pod DONOTDISRUPT to normal namespace
# result: timeout
curl http://svc-private.private:8080 -m 2

# From apps namespace pod DISRUPT to normal namespace
# result: timeout
curl http://svc-private.private:8080 -m 2

# From private namespace to egress
# result: timeout
curl http://www.google.com