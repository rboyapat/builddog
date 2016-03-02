require 'trollop'

module Trollop

  class Parser

    def builddog_opt 
      opt :provider, "Server Provider", :type => :string, :short => :none, :default => 'vsphere'
      opt :controller, "Server Provisioning System Controller", :type => :string, :short => :none, :default => 'none'
      opt :port, "Controller port", :type => :int, :short => :none, :default => 443
      opt :user, "Username", :type => :string, :short => 'u', :default => 'none'
      opt :password, "Password", :type => :string, :short => 'p', :default => 'none'
      opt :operation, "Operation", :type => :string, :short => 'o', :default => 'none'
      opt :vm_name, "VM name", :type => :string, :short => :none, :default => "bdg_testvm"
      opt :guest_id, "VM OS type", :type => :string, :short => :none, :default => "rhel6_64Guest"
      opt :vm_cpu, "VM No of vCPUs", :type => :int, :short => :none, :default => 1
      opt :vm_memory, "VM Memory in MB", :type => :int, :short => :none, :default => 2048 
      opt :vm_disk, "VM Disk Capacity in KB", :type => :int, :short => :none, :default => 4000000
      opt :vm_cluster, "VM Build Cluster", :type => :string, :short => :none, :default => "bdg_cluster01"
      opt :vm_datastore, "VM Build Datastore", :type => :string, :short => :none, :default => "bdg_nasstore01"
      opt :vm_pg, "VM Build NW PortGroup", :type => :string, :short => :none, :default => "bdg_dvVMNetwork-PG"
      opt :vm_ip, "VM IP", :type => :string, :short => :none, :default => 'none' 
      opt :vm_subnet, "VM Subnet", :type => :string, :short => :none, :default => 'none'
      opt :vm_netmask, "VM Netmask", :type => :string, :short => :none, :default => 'none'
      opt :vm_gw, "VM Gateway", :type => :string, :short => :none, :default => 'none'
      opt :vm_domain, "VM Domain Name", :type => :string, :short => :none, :default => "builddog.com"
      opt :vm_dns_servers, "VM DNS servers", :type => :string, :short => :none, :default => 'none'
      opt :clone_name, "VM Clone Source Name", :type => :string, :short => :none, :default => "bdg_cln"
      opt :template_name, "VM template Name", :type => :string, :short => :none, :default => "bdg_tmpt"
      opt :datacenter, "VM Datacenter", :type => :string, :short => :none, :default => "bdg"
      opt :inventory, "Datacenter Inventory File", :type => :string, :short => :none, :default => "~/.bdg_inventory.yaml"
      opt :credentials, "Provisioner Credentials File", :type => :string, :short => :none, :default => "~/.bdg_credentials.yaml"
      opt :vmlist, "VM Build List File", :type => :string, :short => :none, :default => "./bdg_vmlist"
    end

  end

end
