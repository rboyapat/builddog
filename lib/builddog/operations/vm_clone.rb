def vm_clone opts
  clone_name = opts[:clone_name]
  vm_name = opts[:vm_name] 
  vim = RbVmomi::VIM.connect opts
  dc = vim.serviceInstance.find_datacenter(opts[:datacenter]) or abort "datacenter not found"
  vm = dc.find_vm(clone_name) or abort "VM not found"
  relocateSpec = RbVmomi::VIM.VirtualMachineRelocateSpec
  spec = RbVmomi::VIM.VirtualMachineCloneSpec(:location => relocateSpec, :powerOn => false, :template => false)
  vm.CloneVM_Task(:folder => vm.parent, :name => vm_name, :spec => spec).wait_for_completion
end 
