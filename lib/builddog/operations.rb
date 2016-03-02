module BuildDog

##require 'rbvmomi'
  require 'yaml'
  require 'ipaddress'
  require_relative "operations/vsphere"
##require_relative "operations/vm_create"
##require_relative "operations/vm_clone"
## require_relative "operations/vm_template_clone"

  def self.operations ( options )
    options[:host] = options[:provisioner]
    options[:insecure] = true 
    options[:no-ssl] = false
    case options[:operation]
      when "vm_create"
        puts "creating a vm"
        vm_create options
      when "vm_clone"
        puts "cloning a vm"
        vm_clone options
      else
        puts "wrong vm operation"
    end
  end

end
