# WEB

Watch Each Build is a simple HTTP Server to provide (primary) static websites.

## Using

Start from command line interface (CLI) with optional parameters IP address and port number. Default values are ``localhost`` and ``8080``. Default ``working dir`` is your start directory. Change directory before start.

## Not supporting

    * other than ``get``
    * directory browsing
    * index.htm? checking

## Developing

   * see [FileRouterImpl](./Sources/libWeb/Internal/FileRouterImpl.swift) as example implementation.
   * see [Start entry point](./Sources/web/main.swift) how to start
