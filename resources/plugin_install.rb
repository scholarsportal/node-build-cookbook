unified_mode true
property :node_build_root, String, name_property: true
property :git_url, String, default: 'https://github.com/nodenv/node-build.git'
property :git_revision, String, default: 'master'
property :owner, String
property :group, String
deprecated_property_alias :user, :owner,
                          'User property is deprecated. Use owner instead'

action :install do
  node_build_dependencies.each do |dependency|
    package dependency
  end

  git_client 'default'

  directory ::File.dirname(new_resource.node_build_root) do
    owner new_resource.owner if new_resource.property_is_set?(:owner)
    group new_resource.group if new_resource.property_is_set?(:group)
    recursive true
    mode '0755'
  end

  git new_resource.node_build_root do
    repository new_resource.git_url
    revision new_resource.git_revision
    user new_resource.owner if new_resource.property_is_set?(:owner)
    group new_resource.group if new_resource.property_is_set?(:group)
    action :checkout
    not_if { ::File.exist?(::File.join(new_resource.node_build_root, 'bin', 'node-build')) }
  end
end

action_class do
  include Chef::NodeBuild
end
