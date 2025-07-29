Build a STIG hardened RHEL8 AMI
```
cd ~/repos
git clone https://github.com/joelckwong/packer-aws.git
cd packer-aws/
packer build -machine-readable packer-rhel8-stig.json | tee ~/packer-rhel8-stig.out
aws ec2 describe-images --owners self
```

Build a STIG hardened RHEL9 AMI
```
cd ~/repos
git clone https://github.com/joelckwong/packer-aws.git
cd packer-aws/aws/
packer build -machine-readable packer-rhel9-stig.json | tee ~/packer-rhel9-stig.out
aws ec2 describe-images --owners self
```
