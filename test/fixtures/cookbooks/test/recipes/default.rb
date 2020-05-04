if platform_family? 'debian'
  execute 'APT update on debian platforms' do
    command 'apt-get update -qq'
  end
end

include_recipe 'test::plugin_install'
include_recipe 'test::standalone_install'
