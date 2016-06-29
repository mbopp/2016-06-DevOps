require 'spec_helper.rb'

describe "hello_world::default" do
  before do
    Fauxhai.mock(platform: 'centos',version: '6.6')
    stub_command("which nginx").and_return(false)
  end

  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new(file_cache_path: CACHE_PATH.to_s)
    runner.node.automatic_attrs['platform_family'] = 'rhel'
    runner.node.automatic_attrs['platform_version'] = '6.6'
    runner.converge(described_recipe)
  end

  it { expect(chef_run).to install_package('ntp') }

  it { expect(chef_run).to install_package('git') }

  it { expect(chef_run).to create_directory('/var/www/') }

  it { expect(chef_run).to install_package('nginx') }

  it { expect(chef_run).to deploy_application('/var/www/hello_world') }

  it { expect(chef_run).to append_to_ssh_known_hosts 'github.com' }

  it { expect(chef_run).to create_cookbook_file('/etc/nginx/sites-available/hello_world') }

  it { expect(chef_run).to delete_file('/etc/nginx/conf.d/default.conf') }

  it { expect(chef_run).to restart_service('nginx') }
end
