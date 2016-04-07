require 'serverspec'

set :backend, :exec

describe file('/home/testuser/.rvm/bin/rvm') do
  it { should be_file }
  it { should be_executable }
end

describe command("ls /home/testuser/.rvm/rubies") do
  its(:stdout) { should contain("ruby-2.2") }
end
