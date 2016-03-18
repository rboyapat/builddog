require "yaml"
require_relative "builddog/version"
require_relative "builddog/trollop"
require_relative "builddog/providers"

module BuildDog
  def self.print
    puts "#{VERSION}"
  end
end

options = Trollop.options do

  banner <<-EOS
Usage: builddog --provider=vsphere --ip=vcenter.localhost --profile=root --operation=vm_create --vm-name bdg_testvm1 --vm-cluster=bdg-vmcluster01  --vm-datastore=bdg_datastore01 --vm-pg=bdg-VMNetwork --datacenter=dbg  
  EOS

  server_provider_opt
  vsphere_opt
end

case options[:provider]
	when "vsphere"
		if options[:user] == "none" 
			if File.exist? `ls #{options[:creds]}`.chomp!
			  cred_tree = YAML.load(File.open(`ls #{options[:creds]}`.chomp!, "r"))
		    options[:vsphere_user] = cred_tree[options[:profile]]["vsphere_user"]
		    options[:vsphere_password] = cred_tree[options[:profile]]["vsphere_password"]
		  else
		  	puts "please populate the credentials in home dir to connect to the server providers"
      end
    else
      options[:vsphere_user] = options[:user]
      options[:vsphere_password] = options[:password]
    end
	when "aws"
		options[:aws_access_key_id] = cred_tree[options[:profile]]["aws_access_key_id"]
		options[:aws_secret_access_key] = cred_tree[options[:profile]]["aws_secret_access_key"]
	when "openstack"
		options[:openstack_access_key_id] = cred_tree[options[:profile]]["openstack_access_key_id"]
		options[:openstack_secret_access_key] = cred_tree[options[:profile]]["openstack_secret_access_key"]
	else
		puts "Not a valid provider"
		exit
end
		

BuildDog.providers options
