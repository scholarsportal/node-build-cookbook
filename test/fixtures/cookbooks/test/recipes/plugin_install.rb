plugins_home = ::File.join '/tmp', 'plugins'
node_build_home = ::File.join plugins_home, 'node-build'

node_build_plugin_install node_build_home

username = 'node-build-user'

user username do
  comment 'user created to test node-build as plugin with owner'
end

node_build_home = ::File.join plugins_home, 'node-build-with-owner'
node_build_plugin_install node_build_home do
  owner username
  group username
end

node_build_home = ::File.join plugins_home, 'node-build-with-user'
node_build_plugin_install node_build_home do
  user username
  group username
end
