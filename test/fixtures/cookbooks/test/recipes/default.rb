node_build_standalone_install 'node-build'

user 'test-user' do
  home '/home/test-user'
  manage_home true
  action :create
end

node_build_plugin_install ::File.join('/home/test-user', 'plugins', 'node-build')
