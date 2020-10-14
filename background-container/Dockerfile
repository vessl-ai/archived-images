FROM savvihub/system-metrics-collector:0.2 AS system-metrics-collector
FROM savvihub/client

COPY --from=system-metrics-collector /app/system-metrics-collector /usr/local/bin/

RUN apt-get install curl -y

# install kubectl
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

RUN chmod +x ./kubectl

RUN mv ./kubectl /usr/local/bin/kubectl

ENTRYPOINT ["/bin/sh"]
