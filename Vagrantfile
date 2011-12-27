Vagrant::Config.run do |config|

  # CI Server
  config.vm.define :ci_server do |ci_config|
    ci_config.vm.box = "base"
    ci_config.vm.forward_port("web", 8080, 8001)
    ci_config.vm.provision :puppet do |puppet|
      puppet.module_path    = "manifests/modules"
      #puppet.options        = "--verbose --debug"
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "ci.pp"
    end
  end
  
  # CI Target
  config.vm.define :target_server do |target_config|
    target_config.vm.box = "base"
    target_config.vm.forward_port("web", 80, 8002)
    target_config.vm.provision :puppet do |puppet|
      puppet.module_path    = "modules"
      #puppet.options        = "--verbose --debug"
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "target.pp"
    end
  end
end
