# docker-tpt-kafka
Dockerized Teradata Parallel Transporter with Kafka access modules

# Image build
* Clone or Download this repository.
* Download the [Teradata Tools and Utilities - Linux Installation Package: TTU * Ubuntu - Base](http://downloads.teradata.com/download/tools/teradata-tools-and-utilities-linux-installation-package-0) (you will need to register and accept the licence terms). And place the tar.gz file in this directory.
* Navigate to this directory and build the Docker image:

`docker build -t tpt-kafka .`

# Interactive execution
The default entrypoint is bash, you may run this docker in interactive mode to test and execute your TPT job using tbuild. 

`docker run -it tpt-kafka`

We recommend using this image as a base to build you own applications.

# Getting started
This docker provides an example set of scripts (in the `scripts` directory of this repository) loaded in the docker `/home` directory to get you started connecting a Kafka topic and offloading to a Vantage system.
To build your own application you may:

- Modify the *jobvars.txt* variable file to specify your source topic name, Vantage connection details.
- Use the DDL provided in the *target-table.ddl* file to create a landing table in your Vantage system.
- Optionally modify the generic *load_kafka_data.tpt* TPT script as needed.
- Use the *run-load.sh* shell script to execute the TPT job defined above.