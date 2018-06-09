require 'pact/provider/rspec'

require "./spec/service_consumers/provider_states_for_zoo_app"

Pact.service_provider 'Animal Service' do

  honours_pact_with "Zoo App" do
    pact_uri 'https://test.pact.dius.com.au/pacts/provider/Animal%20Service/consumer/Zoo%20App/latest', { username: "dXfltyFMgNOFZAxr8io9wJ37iUpY42M", password: "O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1"}
    publish_verification_results ENV['CI'] == 'true'
    app_version `git rev-parse --verify HEAD`.strip
    app_version_tags [`git rev-parse --abbrev-ref HEAD`.strip]
  end
end
