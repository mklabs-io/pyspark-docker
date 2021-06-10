# PySpark Docker

Convenient Docker image with Java, Python and PySpark pre-installed. Particularly convenient if you see yourself in need of running pyspark related unit/integration tests in an automated workflow.

### Example Use Case

Have your unit tests run inside a docker container and share a `docker-compose.yml` file to declare how to run them. Any team member or your CICD engine of choice will use the exact some method to run the unit-tets.

```yaml
version: "3.0"

services:
  unit-test:
    image: mklabsio/pyspark:py37-spark242
    working_dir: /app
    volumes:
      - .:/app/
    command:
      - /bin/bash
      - -c
      - |
        pip install pytest
        pip install -r ./requirements.txt
        pytest ./tests
```

### Then run

```shell
docker-compose up unit-test
```
