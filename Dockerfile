FROM anupcshan/bazel-arm32v7:0.27.1
VOLUME ["/tmp/build_output", "/tmp/taddons", "/home/jcox/.local:/home/jcox/.local"]
#VOLUME /media/usb/questionbot-aviano-af-covid19/addons:/tmp/taddons
#VOLUME /tmp/build_output:/tmp/build_output
#VOLUME /home/jcox/.local:/home/jcox/.local
WORKDIR /tmp/taddons
RUN ls /home/jcox
RUN uname -a
COPY . /tmp/taddons
RUN pwd
RUN ls
RUN apt-get -y update && apt-get install -y rsync python3-pip
RUN ln -sf /usr/bin/python3 /usr/bin/python
#RUN /usr/bin/bazel build --enable_runfiles build_pip_pkg
#--mount type=bind,source="$(pwd)"/target,target=/app
ENTRYPOINT ["/bin/bash", "-c"]
CMD "/usr/bin/bazel build --enable_runfiles build_pip_pkg; bazel-bin/build_pip_pkg artifacts"