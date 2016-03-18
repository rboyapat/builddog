require 'rbvmomi'

module RbVmomi
  class VIM
  end
end

require_relative "vsphere/vm_create"
require_relative "vsphere/vm_clone"

def vsphere options

  options[:user] = options[:vsphere_user]
  options[:password] = options[:vsphere_password]
  options[:host] = options[:ip]
  options[:insecure] = true

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
