# frozen_string_literal: true

require 'sbmt/pact/rspec'
require 'pact/ffi'
require 'sequel'
require 'animal_service/api'
require 'animal_service/db'
require 'animal_service/animal_repository'
require 'rspec/mocks'
include RSpec::Mocks::ExampleMethods

RSpec.describe 'Verify consumers for Bar Provider', :pact do
  http_pact_provider 'Animal Service'
  # puts pact_config.inspect
  pact_config.instance_variable_set(:@app, AnimalService::Api)
  pact_config.instance_variable_set(:@http_port, 9292)
  pact_config.instance_variable_set(:@pact_dir,
                                    File.expand_path('../../../pacts', __dir__))
  before_state_setup do
    AnimalService::DATABASE[:animals].truncate
  end

  provider_state 'there is an alligator named Mary' do
    set_up do
      AnimalService::DATABASE[:animals].insert(name: 'Mary')
    end
  end

  provider_state 'there is not an alligator named Mary' do
    set_up do
      AnimalService::DATABASE[:animals].truncate
    end
  end

  provider_state 'an error occurs retrieving an alligator' do
    set_up do
      allow(AnimalService::AnimalRepository).to receive(:find_alligator_by_name).and_raise('Argh!!!')
    end
    tear_down do
      allow(AnimalService::AnimalRepository).to receive(:find_alligator_by_name).and_call_original
    end
  end
end
