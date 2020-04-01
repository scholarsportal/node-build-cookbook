# # encoding: utf-8

# Inspec test for recipe node_build::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

plugin_node_build_bin = '/home/test-user/plugins/node-build/bin/node-build'
describe command(plugin_node_build_bin) do
  it { should exist }
  its('exit_status') { should eq 1 }
end

plugin_node_version = '13.12.0'
plugin_node_path = "/tmp/plugin/node-#{plugin_node_version}"
describe bash("#{plugin_node_build_bin} #{plugin_node_version} #{plugin_node_path}") do
  its('exit_status') { should eq 0 }
end

describe file("/tmp/plugin/node-#{plugin_node_version}/bin/node") do
  it { should exist }
end
