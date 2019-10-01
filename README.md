# Elastic Search and Mongodb Link Docker
Plugin using for connecting mongodb and elasticsearch : https://github.com/richardwilly98/elasticsearch-river-mongodb

This project will help you to setup mongodb and elastic search quickly and helps you to sync mongodb collecitons with elasticsearch to perform your searches.
# Running 
```bash 
docker-compose up -d
```

# Connecting Mongodb Collection to ElasticSearch with river and Querying
```bash
  curl -XPUT 'http://localhost:9200/_river/mongodb/_meta' -d '{
    "type": "mongodb", 
    "mongodb": { 
      "db": "DATABASE_NAME", 
      "collection": "COLLECTION", 
      "gridfs": true,
      "servers": [
        {
          "host": "mongodb",
           "port": 27017
        }
      ]
    }, 
    "index": { 
      "name": "ES_INDEX_NAME", 
      "type": "ES_TYPE_NAME" 
    }
  }'
```

Example:

```bash
  curl -XPUT 'http://localhost:9200/_river/mongodb/_meta' -d '{ 
    "type": "mongodb", 
    "mongodb": { 
      "db": "testmongo", 
      "collection": "person",
      "servers": [
        {
          "host": "mongodb",
           "port": 27017
        }
      ]
    }, 
    "index": {
      "name": "mongoindex", 
      "type": "person" 
    }
  }'
```

Import data from mongo console:

```bash
  use testmongo
  var p = {firstName: "Archit", lastName: "Dwivedi"}
  db.person.save(p)
```

Query index:

```bash
  curl -XGET 'http://localhost:9200/mongoindex/_search?q=firstName:Archit'
```

# Services Running
* Mongodb(3.0.0) Port: 27017
* Elastic Search(1.7.3) Port: 9200: Log in 

# Check Services
MongoDB: 
```bash 
# Check logs
docker-compose logs -f mongodb
# Log in Mongodb
docker-compose exec mongodb bash
```
Elastic Search: 
```bash 
# Check Logs
docker-compose logs -f elasticsearch
# Log in ElasticSearch
docker-compose exec elasticsearch bash
```



