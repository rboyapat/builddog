# Builddog

ruby library to deploy servers ( baremetal or VM ) across datacenters

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

* using user/password

builddog --provider=vsphere --controller=vcenter.localhost --port=443 --user=root --password=password --operation=vm_create --vm-name bdg_testvm1 --vm-cluster=bdg-vmcluster01  --vm-datastore=bdg_nasstore01 --vm-pg=bdg-VMNetwork --datacenter=dbg

* using profile

builddog --provider=vsphere --controller=vcenter.localhost --port=443 --profile=root --operation=vm_create --vm-name bdg_testvm1 --vm-cluster=bdg-vmcluster01  --vm-datastore=bdg_nasstore01 --vm-pg=bdg-VMNetwork --datacenter=dbg

## Contributing

1. Fork it ( https://github.com/rboyapat/builddog/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
