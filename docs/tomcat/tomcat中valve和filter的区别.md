[difference between a valve and a filter](https://stackoverflow.com/questions/5537467/difference-between-a-valve-and-a-filter)



> A Valve element represents a component that will be inserted into the request processing pipeline for the 
associated Catalina container.

> The servlet filters serve the exact same purpose, but valves are Tomcat's specific classes, tightly coupled to Tomcat infrastructure/API. On the other hand servlet API is implemented by all compatible web containers. That said, valves won't work with e.g. Jetty, which has different API for that, while servlet filters will.

> The other important difference is that valves are working on container level (intercepting all applications/requests), while servlet filters are intercepting all request only to a given application. So if you want to implement server-wide interceptor, valves are necessary.

> 原则上使用filter，除非有充足的理由使用valve