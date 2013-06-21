Vagrant::Config.run do |config|

  # name of vagrant box
  config.vm.box = "haproxy"

  # Forward guest port 80 to host port 8888
  config.vm.forward_port 80, 8888

  # update apt on debian systems
  #config.vm.provision :shell, :inline => 'which apt-get && apt-get -y update'		# comment out to speed up reloads

  # chef-solo provisioning
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = 'cookbooks'
    chef.json.merge!(JSON.parse(File.read('node.json')))
    chef.run_list = JSON.parse(File.read('node.json'))['run_list']
    #chef.run_list = []
    #chef.log_level = :debug
  end

end