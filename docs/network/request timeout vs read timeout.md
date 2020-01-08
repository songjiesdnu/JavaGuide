request timeout = maximum duration for completing a request from the user's perspective. It can account for the time to resolve the hostname, to open the TCP connection, to perform TLS handshake, to write the request and receive the complete response.

read timeout = maximum time between consecutive reads. Typically used to crash when a large download is no longer making any progress.

[https://stackoverflow.com/questions/38236972/async-http-client-what-is-the-difference-between-readtimeout-and-requesttimeout](https://stackoverflow.com/questions/38236972/async-http-client-what-is-the-difference-between-readtimeout-and-requesttimeout)