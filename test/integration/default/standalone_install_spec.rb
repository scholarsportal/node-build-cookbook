# # encoding: utf-8

# Inspec test for recipe node_build::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

standalone_node_build_bin = '/usr/local/bin/node-build'
describe command(standalone_node_build_bin) do
  it { should exist }
  its('exit_status') { should eq 1 }
end

standalone_node_version = '12.16.1'
standalone_node_path = "/tmp/standalone/node-#{standalone_node_version}"
describe bash("#{standalone_node_build_bin} #{standalone_node_version} #{standalone_node_path}") do
  its('exit_status') { should eq 0 }
end

describe file(::File.join standalone_node_path, 'bin', 'node') do
  it { should exist }
end
