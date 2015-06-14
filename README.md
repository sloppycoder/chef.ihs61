
## Cookbook for IBM HTTP server 6.1
This cookbook is for installing IBM HTTP 6.1 32bit on Centos/RHEL server.

### Platform
only tested with Centos 6.6 and RHEL 6.5.


#### To test on a node
knife bootstrap machine --ssh-user root --ssh-password 'chefchefchef' --node-name aws1
knife ssh machine 'chef-client' --manual-list --ssh-user root --ssh-password 'chefchefchef' 