# Builddog

Build tool to deploy servers ( baremetal or VM ) across datacenters

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'builddog'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install builddog

## Usage

*Populate credentials file in home directory:*
```
touch ~/.bdg_credentials.yaml
chmod 600 ~/.bdg_credentials.yaml
```
*sample credenetials file:*
```
default:
  vsphere_user: bdgdog 
  vsphere_password: secret99 
  aws_access_key_id: xxxxxx 
  aws_secret_access_key: xxxxx 
  openstack_access_key_id: xxxxx 
  openstack_aws_secret_access_key: xxxxx 
root:
  vsphere_user: root 
  vsphere_password: xxxxx
  aws_access_key_id: xxxxx 
  aws_aws_secret_access_key: xxxxx 
  openstack_access_key_id: xxxxx 
  openstack_secret_access_key: xxxxx 
```
### vSphere:

**username/password on command line:**
```
builddog --provider=vsphere --ip=vcenter.localhost --user=root --password=password --operation=vm_create --vm-name bdg_testvm1 --vm-cluster=bdg-vmcluster01  --vm-datastore=bdg_datastore01 --vm-pg=bdg-VMNetwork --datacenter=dbg 
```

**using profile:**
```
builddog --provider=vsphere --ip=vcenter.localhost --profile=root --operation=vm_create --vm-name bdg_testvm1 --vm-cluster=bdg-vmcluster01  --vm-datastore=bdg_datastore01 --vm-pg=bdg-VMNetwork --datacenter=dbg
```
### AWS:

### Open Stack:

## Contributing

1. Fork it ( https://github.com/rboyapat/builddog/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
