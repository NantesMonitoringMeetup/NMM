Compilation de hindsight :
```
#sudo docker run -t -i -v /usr/src:/usr/src debian:jessie


apt-get update
apt-get install -y gcc cmake git\
  make \
  libgeoip-dev g++
# g++ pour rjson
# geoip nÃcessite une version trÃs rÃcente (>= stretch)

mkdir -p /usr/src/github.com/mozilla-services
cd /usr/src/github.com/mozilla-services
for repo in lua_sandbox hindsight  lua_sandbox_extensions; do
  git clone https://github.com/mozilla-services/$repo.git
done

for repo in lua_sandbox hindsight; do
  cd $repo
  mkdir release
  cd release
  cmake -DCMAKE_BUILD_TYPE=release ..
  make
  ctest
  cpack -G DEB
  dpkg -i *.deb
  cd ../..
done

  repo=lua_sandbox_extensions
  cd $repo
  mkdir release
  cd release
  cmake -DCMAKE_BUILD_TYPE=release -DENABLE_ALL_EXT=true \
    -DEXT_geoip=false \
    -DEXT_kafka=false \
    -DEXT_openssl=false \
    -DEXT_postgres=false \
    -DEXT_snappy=false \
    -DEXT_ssl=false \
    -DEXT_zlib=false \
    -DCPACK_GENERATOR=DEB ..
  # NB: geoip nÃ©cessite libgeoip-dev >> ?? (avec GEOIP_SILENCE)
  make
  ctest
  make packages
  dpkg -i *.deb
  cd ../..

```
