FROM arm64v8/ubuntu:22.04

RUN apt update && apt install -y \
  git build-essential cmake automake libtool autoconf \
  libssl-dev libhwloc-dev libuv1-dev curl

WORKDIR /xmrig
COPY . .

RUN mkdir build && cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DWITH_HWLOC=ON -DWITH_STATIC_LIBS=ON && \
    make -j$(nproc)
