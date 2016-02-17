# Available commands:
# Testing the specification:
#   bundle exec rake spec
# Building a gem from source with rake:
#   bundle exec rake package
# Building a gem from source with rubygems:
#   bundle exec gem build rtp-connect.gemspec
# Create html documentation files:
#   bundle exec rake yard

require 'rubygems/package_task'
require 'rspec/core/rake_task'
require 'yard'

# Build gem:
gem_spec = eval(File.read('rtp-connect.gemspec'))
Gem::PackageTask.new(gem_spec) do |pkg|
  pkg.gem_spec = gem_spec
end

# RSpec 2:
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ["-c", "-f progress", "-r ./spec/spec_helper.rb"]
  t.pattern = 'spec/**/*_spec.rb'
end

# Build documentation (YARD):
YARD::Rake::YardocTask.new do |t|
  t.options += ['--title', "RTP-Connect #{RTP::VERSION} Documentation"]
end