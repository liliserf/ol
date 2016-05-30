Rails.application.configure do 
  config.generators do |g|
    g.orm :active_record, migration: true
    g.test_framework :rspec, fixture: true
    g.fixture_replacement :factory_girl, dir: 'spec/factories'
    g.helper false
    g.decorator false
    g.controller assets: false
  end
end