require 'sisecommerce'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.ignore_localhost = true
  config.before_record do |interaction|
    interaction.response.decompress if interaction.response.compressed?
  end
end

RSpec.configure do |config|
  config.order = "random"
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.before(:each) do
    allow(Sisecommerce).to receive(:api_token).and_return('123456')
    allow(Sisecommerce).to receive(:store_name).and_return('teststore')
  end
end
