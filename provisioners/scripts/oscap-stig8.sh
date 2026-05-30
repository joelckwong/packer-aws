#!/bin/bash
set -ex
# Run openscap stig scan
sudo yum install -y openscap-scanner scap-security-guide audispd-plugins libcap-ng-utils unzip
curl -O https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/scc-5.14.1_rhel8_oracle-linux8_x86_64_bundle.zip
unzip scc-5.14.1_rhel8_oracle-linux8_x86_64_bundle.zip
sudo rpm -ivh scc-5.14.1_rhel8_x86_64/scc-5.14.1.rhel8.x86_64.rpm
sudo sed -i '/xccdf_org\.ssgproject\.content_rule_sudo_remove_nopasswd/s/selected="true"/selected="false"/' /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml
sudo oscap xccdf eval --remediate --profile xccdf_org.ssgproject.content_profile_stig --results ~/rhel8-oscap-results.xml --report ~/rhel8-oscap-report.html --fetch-remote-resources /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml
sudo oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_stig --results ~/rhel8-oscap-results.xml --report ~/rhel8-oscap-report.html --fetch-remote-resources /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml
#sudo /opt/scc/cscc
