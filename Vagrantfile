Vagrant::Config.run do |config|

  # Test Server
  config.vm.define :test_server do |test_config|
    test_config.vm.box = "base"
    test_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "tests"
      puppet.manifest_file  = "init.pp"
    end
  end
end
