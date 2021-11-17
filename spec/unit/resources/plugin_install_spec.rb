require 'spec_helper'

describe 'plugin install' do
  step_into :node_build_plugin_install
  platform 'ubuntu'

  context 'with default attributes' do
    recipe do
      node_build_plugin_install '/tmp/plugins/default-attributes'
    end

    it { is_expected.to install_node_build_plugin_install('/tmp/plugins/default-attributes') }
    it { is_expected.to create_directory(::File.dirname('/tmp/plugins/default-attributes')).with(user: nil, group: nil) }
    it { is_expected.to checkout_git('/tmp/plugins/default-attributes').with(repository: 'https://github.com/nodenv/node-build.git', revision: 'master') }
  end

  context 'with custom attributes' do
    recipe do
      node_build_plugin_install '/tmp/plugins/custom-attributes' do
        owner 'user'
        group 'group'
        git_url 'https://url.git'
        git_revision 'revision'
      end
    end

    it { is_expected.to install_node_build_plugin_install('/tmp/plugins/custom-attributes') }
    it { is_expected.to create_directory(::File.dirname('/tmp/plugins/custom-attributes')).with(user: 'user', group: 'group') }
    it { is_expected.to checkout_git('/tmp/plugins/custom-attributes').with(repository: 'https://url.git'), revision: 'revision' }
  end
end
