class Chef
  module NodeBuild
    def node_build_dependencies
      [python, gcc, make].compact
    end

    def python
      version = node['platform_version'].to_i
      if platform?('centos') && version >= 8 then 'python3'
      elsif platform?('ubuntu') && version >= 20 then 'python3'
      elsif platform?(*supported_plaftorms) then 'python'
      end
    end

    def gcc
      case node['platform_family']
      when 'amazon', 'fedora', 'rhel' then 'gcc-c++'
      when 'debian' then 'g++'
      end
    end

    def make
      'make' if platform?(*supported_plaftorms)
    end

    def supported_plaftorms
      %w(amazon centos debian fedora oracle ubuntu)
    end
  end
end
