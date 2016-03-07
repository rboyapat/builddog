def vm_create opts

  vm_name = opts[:vm_name]
  guest_id = opts[:guest_id] 
  vm_cpu = opts[:vm_cpu]
  vm_memory = opts[:vm_memory]
  vm_disk = opts[:vm_disk]
  vm_cluster = opts[:vm_cluster]
  vm_datastore = opts[:vm_datastore] 
  vm_pg = opts[:vm_pg] 

  vim = RbVmomi::VIM.connect opts
  dc = vim.serviceInstance.find_datacenter(opts[:datacenter]) or abort "Datacenter not found"
  vmFolder = dc.vmFolder
  bd_cluster=" "
  dc.hostFolder.children.each do |cluster|
    if cluster.name == "#{vm_cluster}"
      bd_cluster=cluster   
    end
  end

  rp = bd_cluster.resourcePool

  dvsm = vim.serviceContent.dvSwitchManager
  bd_host = bd_cluster.host[rand(bd_cluster.host.length)]
  bd_vswitch = dvsm.QueryDvsConfigTarget(:host => bd_host).distributedVirtualPortgroup
  bd_pg = ""
  bd_switch_uuid = ""
  bd_switch_name = ""
  bd_pgkey = ""
  bd_vswitch.each { |t_pg|
    if t_pg.portgroupName.to_s == "#{vm_pg}" 
      bd_pg = t_pg.portgroupName
      bd_switch_uuid = t_pg.switchUuid
      bd_switch_name = t_pg.switchName
      bd_pgkey = t_pg.portgroupKey
    end
  }

  vm_cfg = {
    :name => vm_name,
    :guestId => guest_id,
    :files => { :vmPathName => "[#{vm_datastore}]" },
    :numCPUs => vm_cpu,
    :memoryMB => vm_memory,
    :deviceChange => [ 
    {
      :operation => :add,
      :device => RbVmomi::VIM.VirtualLsiLogicController( :key => 1000, :busNumber => 0, :sharedBus => :noSharing)
    }, 
    {
      :operation => :add,
      :fileOperation => :create,
      :device => RbVmomi::VIM.VirtualDisk( :key => 0, :backing => RbVmomi::VIM.VirtualDiskFlatVer2BackingInfo( :fileName => "[#{vm_datastore}]", :diskMode => :persistent, :thinProvisioned => true), :controllerKey => 1000, :unitNumber => 0, :capacityInKB => vm_disk )
    }, 
    {
      :operation => :add,
      :device => RbVmomi::VIM.VirtualE1000( :key => -1, :deviceInfo => { :label => 'Network Adapter 1', :summary => bd_pg }, :backing => RbVmomi::VIM.VirtualEthernetCardDistributedVirtualPortBackingInfo( :port => RbVmomi::VIM.DistributedVirtualSwitchPortConnection( :portgroupKey => bd_pgkey, :switchUuid => bd_switch_uuid)), :addressType => 'generated')
    }
    ],
    :extraConfig => [ { :key => 'bios.bootOrder', :value => 'ethernet0' } ]
  }

  vmFolder.CreateVM_Task(:config => vm_cfg, :pool => rp).wait_for_completion
end
