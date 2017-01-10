Oracle Well Known Errors
========================

# Overview

# Tools

## SQL*Plus

### SP2-1502: HTTP proxy server

The following error will occur when HTTP_PROXY or NO_PROXY are defined:

```
Error 46 initializing SQL*Plus
HTTP proxy setting has incorrect value
SP2-1502: The HTTP proxy server specified by http_proxy is not accessible
```

To fix it then just undefine those two environment variables.
