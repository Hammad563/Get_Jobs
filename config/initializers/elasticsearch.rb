require 'elasticsearch/model'

Elasticsearch::Model.client = Elasticsearch::Client.new(url: 'http://hammad01:hammad01@localhost:9200', log: true, transport_options: { request: {timeout: 5}})
#curl -u hammad01 -XDELETE "http://localhost:9200/jobs_publisheds"
