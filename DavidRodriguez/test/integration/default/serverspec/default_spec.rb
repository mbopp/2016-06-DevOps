require_relative File.expand_path('../../../../kitchen/data/spec_helper.rb', __FILE__)

describe package('ntp') do
  it { is_expected.to be_installed }
end

describe service('nginx') do
  it { is_expected.to be_enabled }
  it { is_expected.to be_running }
end

describe command('curl http://localhost/') do
  its(:stdout) { is_expected.to contain 'Hello World' }
end
