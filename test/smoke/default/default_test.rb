# # encoding: utf-8

# Inspec test for recipe node_build::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe command('git') do
  it { should exist }
  its('exit_status') { should eq 1 }
  its('stdout') { should include('usage: git') }
end

describe command('/usr/local/bin/node-build') do
  it { should exist }
  its('exit_status') { should eq 1 }
end
