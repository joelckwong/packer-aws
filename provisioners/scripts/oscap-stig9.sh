#!/bin/bash
set -ex
# Run openscap stig scan
sudo yum install -y openscap-scanner scap-security-guide audispd-plugins libcap-ng-utils unzip
curl -O https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/scc-5.10.2_rhel9_oracle-linux9_x86_64_bundle.zip
unzip scc-5.10.2_rhel9_oracle-linux8_x86_64_bundle.zip
sudo rpm -ivh scc-5.10.2_rhel9_x86_64/scc-5.10.2.rhel9.x86_64.rpm
sudo sed -i '/nopasswd.*true/d' /usr/share/xml/scap/ssg/content/ssg-rhel9-ds.xml
sudo oscap xccdf eval --remediate --profile xccdf_org.ssgproject.content_profile_stig --results ~/oscap-results.xml --report ~/oscap-report.html --fetch-remote-resources /usr/share/xml/scap/ssg/content/ssg-rhel9-ds.xml
sudo oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_stig --results ~/oscap-results.xml --report ~/oscap-report.html --fetch-remote-resources /usr/share/xml/scap/ssg/content/ssg-rhel9-ds.xml
#sudo /opt/scc/cscc
