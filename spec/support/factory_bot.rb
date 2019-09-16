# RSpec without Rails
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.factories.clear
    FactoryBot.find_definitions
  end
end
