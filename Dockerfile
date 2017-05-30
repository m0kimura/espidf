FROM m0kimura/ubuntu-base

ARG user=${user:-docker}
ENV PATH=$PATH:/home/$user/esp/xtensa-esp32-elf/bin IDF_PATH=/home/$user/esp/esp-idf
RUN apt-get update && \
    apt-get install -y libncurses-dev flex bison gperf python-serial && \
    cd /home/${user} && mkdir -p esp && cd esp && \
    wget https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-61-gab8375a-5.2.0.tar.gz && \
    tar -xzf xtensa-esp32-elf-linux64-1.22.0-61-gab8375a-5.2.0.tar.gz && \
    rm  xtensa-esp32-elf-linux64-1.22.0-61-gab8375a-5.2.0.tar.gz && \
    git clone --recursive https://github.com/espressif/esp-idf.git && \
    usermod -a -G dialout ${user} && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
ADD starter.sh /home/${user}/starter.sh

VOLUME /home/${user}
VOLUME /home/${user}/source
USER ${user}
WORKDIR /home/${user}
ENV USER=${user} HOME=/home/${user}
CMD /bin/bash

