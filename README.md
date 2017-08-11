# Docker image for local Zeppelin development

### Setup
Before being able to successfully connect to elasticsearch, you'll need
to get the certificate and add them to the local directory so that the
Dockerfile has access to it. The elasticsearch instance in question is:

https://exp-elasticsearch.default.svc.cluster.local:9200/

* Windows/Chrome instructions: http://docs.bvstools.com/home/ssl-documentation/exporting-certificate-authorities-cas-from-a-website
* Mac/Chrome instructions:
  * Visit the elasticsearch link above and accept any security warnings
    due to an invalid certificate authority
  * open up the chrome DevTools (cmd+option+j or right-click and click
    inspect)
  * Click on the security tab
  * Click view certificate
  * Drag the certificate icon into a finder window

#### Running

```
docker-compose up
```

It takes a little while to load up, then visit `localhost:8080` in your
browser. If you can't access localhost at 8080, you may need to verify
your docker setup is properly mapping ports to localhost. If you're
using Kitematic, you can open it and check the "Hostname/Ports" tab to
ensure the mapping is happening correctly.

You'll now need to configure elasticsearch for the spark interpreter.
1. Click the 'anonymous' user in the upper right hand corner and click
intepreter.
2. Scroll down to the spark section
3. Click edit and add the following configuration options, line by line:

```
es.index.auto.create = false
es.nodes = elasticsearch.exp-dev.io    (NOTE if you can’t get it to work
with this, you’ll need to change it to 100.71.235.5 – some name
resolution issues here)
es.write.operation = index
es.net.ssl = true
es.net.ssl.cert.allow.self.signed = true
```

You should now be able to run any of the ES notebooks.
