unified_mode true
property :prefix, String, default: '/usr/local'

action :install do
  node_build_dependencies.each do |dependency|
    package dependency
  end

  node_build_plugin_install node_build_source

  execute "node-build standalone install #{new_resource.prefix}" do
    cwd node_build_source
    command 'sh install.sh'
    environment('PREFIX' => new_resource.prefix)
    group 'staff' if platform_family? 'debian'
    creates node_build_bin
  end
end

action_class do
  include Chef::NodeBuild

  def node_build_source
    ::File.join(Chef::Config[:file_cache_path], 'node-build')
  end

  def node_build_bin
    ::File.join(new_resource.prefix, 'share', 'node-build', 'bin', 'node-build')
  end
end
