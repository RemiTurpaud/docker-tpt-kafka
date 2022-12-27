FROM ubuntu
LABEL author="remi.turpaud@teradata.com"
LABEL description="Base Teradata Parallel Transporter with Kafka access module"
LABEL usage="See example TPT scripts and shell entry point in home directory"

#Update system

RUN apt-get -y update

# Install libraries for TPT Kafka access module
RUN apt-get -y install lib32stdc++6 libsasl2-2 libltdl-dev

# Install Python
RUN apt-get -y install python3 python3-pip

# Install Teradata Tools & Utilities
# download the Teradata Tools and Utilities - Linux Installation Package for  Ubuntu from downloads.teradata.com
# and place it in the same directory as this file.
ADD TeradataToolsAndUtilitiesBase__ubuntu_*.tar.gz tmp/
RUN cd tmp; find . -name '*.tar.gz' -exec tar zxvf {} --strip=1 \;

#Install TPT
RUN cd /tmp/TeradataToolsAndUtilitiesBase; ./setup.sh kafkaaxsmod tptbase

# Add scrpts
ADD scripts /home/
RUN chmod 775 /home/run-load.sh

#Add entry point - example
ENTRYPOINT [ "bash" ]