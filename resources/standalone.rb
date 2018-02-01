property :git_url, String, default: 'https://github.com/nodenv/node-build.git'
property :git_revision, String, default: 'master'
property :git_destination, String, default: ::File.join(Chef::Config[:file_cache_path], 'node-build')

property :node_build_share_path, String, default: '/usr/local/node-build/share'

action :install do
  include_recipe 'git'

  git new_resource.git_destination do
    repository new_resource.git_url
    reference new_resource.git_revision
    action :checkout
  end

  execute 'node-build install' do
    cwd new_resource.git_destination
    command 'sh install.sh'
    creates ::File.join(new_resource.node_build_share_path, 'bin', 'node-build')
  end
end
