FROM debian:buster-slim

RUN apt-get update && apt-get install -y curl
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup-install.sh
RUN chmod +x rustup-install.sh
RUN ./rustup-install.sh -y

ENV PATH="/root/.cargo/bin:${PATH}"

RUN rustup install nightly-2019-09-05

RUN mkdir /src
WORKDIR /src

RUN rustup override set nightly-2019-09-05
