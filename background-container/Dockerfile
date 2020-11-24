FROM savvihub/system-metrics-collector:0.5 AS system-metrics-collector
FROM gcr.io/savvy-kit-260206/aron-backend-kernel:py36-cuda10.1

COPY --from=system-metrics-collector /app/system-metrics-collector /usr/local/bin/

RUN apt-get update && apt-get install curl gcc git -y

# install kubectl
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

RUN chmod +x ./kubectl

RUN mv ./kubectl /usr/local/bin/kubectl

RUN pip install savvihub==0.0.31

ENTRYPOINT ["/bin/sh"]
