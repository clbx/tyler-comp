FROM steamcmd/steamcmd
RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
    chmod +x /usr/bin/yq
COPY . .
RUN chmod +x buildpack.sh
ENTRYPOINT [ "./buildpack.sh" ]
#CMD [ "./buildpack.sh" ]