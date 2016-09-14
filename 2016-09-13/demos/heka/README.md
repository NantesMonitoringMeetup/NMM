
Building heka for Debian
```
go_version=1.4.3
go_sha1sum=332b64236d30a8805fc8dd8b3a269915b4c507fe
 
if true; then
sed -i 's/httpredir\.debian\.org/ftp.fr.debian.org/' /etc/apt/sources.list
apt-get update
apt-get upgrade -y
 
# Pré-requis de compilation :
## wget pour télécharger go
## deuxième ligne issue de la doc
apt-get install --no-install-recommends -y wget g++ \
  cmake git mercurial make gcc libc6-dev patch ca-certificates libgeoip-dev pkg-config debhelper fakeroot
 
## Go >= 1.4 (cf. http://golang.org/doc/install)
wget "https://storage.googleapis.com/golang/go${go_version}.linux-amd64.tar.gz"
echo "${go_sha1sum}  go${go_version}.linux-amd64.tar.gz" > go.txt
sha1sum --strict --check go.txt || {
  echo 'Erreur sha1sum'
  read
}
 
tar -C /usr/local -xzf go${go_version}.linux-amd64.tar.gz
export PATH="$PATH:/usr/local/go/bin"
 
# Clone du dépôt
mkdir /root/heka
cd /root/heka
git init
 
 
git remote add origin https://github.com/mozilla-services/heka
git remote add sathieu https://github.com/sathieu/heka
 
# Partie idem-potente suit:
cd /root/heka
rm -rf build
git fetch --all
 
git reset --hard origin/versions/0.10
git checkout -B build
 
export GIT_COMMITTER_EMAIL='heka@example.org'
 
 
# Ne pas tenter de fusionner CHANGES.txt
# http://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#Merge-Strategies
echo 'CHANGES.txt merge=ours' >> .gitattributes
git config merge.ours.driver true
git add .gitattributes
GIT_AUTHOR_EMAIL="$GIT_COMMITTER_EMAIL" git commit -m'Ignore changes to CHANGES.txt'
 
# Gestion syslog (https://github.com/mozilla-services/heka/pull/1760)
git cherry-pick -x sathieu/syslog
#  Support sd_notify (from systemd) for reliable service status (https://github.com/mozilla-services/heka/pull/1672)
git cherry-pick -x sathieu/sd_notify
# + Version lua_sandbox https://github.com/mozilla-services/lua_sandbox/pull/132
git cherry-pick -x sathieu/lua_sandbox_nantes
# Improve error reporting when Decoder initialization failed https://github.com/mozilla-services/heka/pull/1932
git cherry-pick -x sathieu/catch_decoder_init
# Support GeoIP flags https://github.com/mozilla-services/heka/pull/1935
git cherry-pick -x sathieu/geoip_flags
 
# FIXME Garder les dernières modifs dans le paquet
git log -n 30 > CHANGES
cat CHANGES.txt >> CHANGES
 
unset GIT_COMMITTER_EMAIL
 
# Compilation et tests
source build.sh && ctest
 
# Paquets
majorversion="$(cut -d. -f1 /etc/debian_version)"
shortdate="$(date +%Y%m%d)"
CPACK_DEBIAN_PACKAGE_VERSION_SUFFIX="+deb$majorversion+$shortdate" make deb
 
cp -v /root/heka/build/heka_*_amd64.deb /debs
fi
```
