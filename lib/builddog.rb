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
Usage: builddog --provider=vsphere --controller=vcenter.localhost --port=443 --user=root --password=password --operation=vm_create --vm-name bdg_testvm1 --vm-cluster=bdg-vmcluster01  --vm-datastore=bdg_nasstore01 --vm-pg=bdg-VMNetwork --datacenter=dbg
       builddog --provider=vsphere --controller=vcenter.localhost --port=443 --profile=root --operation=vm_create --vm-name bdg_testvm1 --vm-cluster=bdg-vmcluster01  --vm-datastore=bdg_nasstore01 --vm-pg=bdg-VMNetwork --datacenter=dbg  
  EOS

  server_provider_opt
  vsphere_opt
end

if options[:user] == "none"
	if options[:profile]
		if File.open(`ls #{options[:credentials]}`.chomp!, "r")
			cred_tree = YAML.load(File.open(`ls #{options[:credentials]}`.chomp!, "r"))
			case options[:provider]
			  when "vsphere"
			  	options[:user] = cred_tree[options[:profile]]["vsphere_user"]
			  	options[:password] = cred_tree[options[:profile]]["vsphere_password"]
			  when "aws"
			  	options[:access_key_id] = cred_tree[options[:profile]]["aws_access_key_id"]
			  	options[:aws_secret_access_key] = cred_tree[options[:profile]]["aws_secret_access_key"]
			  when "openstack"
			  	options[:access_key_id] = cred_tree[options[:profile]]["openstack_access_key_id"]
			  	options[:aws_secret_access_key] = cred_tree[options[:profile]]["openstack_secret_access_key"]
			  else
			  	puts "Not a valid provider"
			  	exit
			end
		else
			puts "Not able to load credentials file"
			exit
    end	
	else
		puts "Please specify user profile to connect to server provider"
		exit
	end 
end

BuildDog.providers options
