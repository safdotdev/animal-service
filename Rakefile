$: << File.join(File.dirname(__FILE__), "lib")

require 'pact/tasks'

task :default => 'pact:verify'

Pact::VerificationTask.new(:local) do | task |
  task.uri 'http://localhost:9292/pacts/provider/Animal%20Service/consumer/Zoo%20App/latest/master'
end

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('pact:v2:verify') do |task|
  task.pattern = 'spec/pact/consumers/*_spec.rb'
  task.rspec_opts = ['-t pact_v2', '--require pact_v2_helper']
end
