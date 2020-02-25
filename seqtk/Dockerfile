FROM alpine:latest

ENV app_name seqtk
ARG app_vers=v1.3
ENV app_path ${app_name}


LABEL app.name="${app_name} ${app_version}" \
      app.desc="Seqtk is a fast and lightweight tool for processing sequences \
                in the FASTA or FASTQ format. It seamlessly parses both FASTA \
                and FASTQ files which can also be optionally compressed by \
		gzip." \
      app.site="https://github.com/lh3/seqtk" \
      maintainer="B. Leopold, benjamin.leopold@jax.org"

WORKDIR /opt
ENV PATH "/opt/${app_path}:$PATH"
RUN apk update &&      \
    apk add --no-cache \
        git            \
        bash           \
        gcc            \
        libc-dev       \
        zlib-dev       \
        make

SHELL ["/bin/bash", "-euc"]
RUN git clone https://github.com/lh3/seqtk.git \
    && cd seqtk \
    && git checkout -q ${app_vers} \
    && make

ENTRYPOINT ["seqtk"]
#CMD ["subseq"]
