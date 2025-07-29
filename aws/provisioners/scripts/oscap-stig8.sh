#!/bin/bash
set -ex
# Run openscap stig scan
sudo yum install -y openscap-scanner scap-security-guide audispd-plugins libcap-ng-utils unzip
sudo sed -i '/nopasswd.*true/d' /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml
sudo oscap xccdf eval --remediate --profile xccdf_org.ssgproject.content_profile_stig --results ~/oscap-results.xml --report ~/oscap-report.html --fetch-remote-resources /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml
sudo oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_stig --results ~/oscap-results.xml --report ~/oscap-report.html --fetch-remote-resources /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml
curl -O https://public.cyber.mil/wp-content/uploads/stigs/zip/scc-5.10.2_rhel8_oracle-linux8_x86_64_bundle.zip
unzip scc-5.10.2_rhel8_oracle-linux8_x86_64_bundle.zip
sudo rpm -ivh scc-5.10.2_rhel8_x86_64/scc-5.10.2.rhel8.x86_64.rpm
sudo /opt/scc/cscc
sed -i 's/umask 077/umask 022/g' /etc/profile /etc/*rc
