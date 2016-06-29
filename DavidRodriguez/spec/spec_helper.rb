require 'chefspec'
require 'chefspec/berkshelf'
require 'fauxhai'

CACHE_PATH = "/tmp/rspec_#{(0...8).map { (65 + rand(26)).chr }.join}".freeze

at_exit { ChefSpec::Coverage.report! }

RSpec.configure do |config|
  config.after(:all) do
    FileUtils.rm_rf(Dir[CACHE_PATH.to_s])
  end
end
