require 'serverspec'

set :backend, :exec

# it installs RVM for the user
describe file('/home/testuser/.rvm/bin/rvm') do
  it { should be_file }
  it { should be_executable }
end

# it installs the specified Ruby
describe command("ls /home/testuser/.rvm/rubies") do
  its(:stdout) { should contain("ruby-2.2") }
end

# it creates a gemset
describe command("ls /home/testuser/.rvm/gems") do
  its(:stdout) { should contain(/ruby-2.2.\d@testapp/) }
end

# it creats an RVM wrapper for bundle
describe file('/home/testuser/.rvm/bin/testapp_bundle') do
  it { should be_file }
  it { should be_executable }
end
