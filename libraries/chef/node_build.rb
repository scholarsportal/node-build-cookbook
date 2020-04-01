class Chef
  module NodeBuild
    def node_build_dependencies_for(platform)
      case platform
      when 'amazon', 'rhel', 'fedora', 'centos', 'opensuseleap'
        %w(python gcc-c++ make)
      when 'ubuntu', 'debian'
        if platform?('ubuntu') && node['platform_version'].to_i >= 20
          %w(python3 g++ make)
        else
          %w(python g++ make)
        end
      else []
      end
    end
  end
end
