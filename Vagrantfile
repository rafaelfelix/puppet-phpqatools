Vagrant::Config.run do |config|

  # CI Server
  config.vm.define :ci_server do |ci_config|
    ci_config.vm.box = "base"
    ci_config.vm.forward_port("web", 8080, 8001)
    ci_config.vm.provision :puppet do |puppet|
      puppet.module_path    = "modules"
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "ci.pp"
    end
  end
end
