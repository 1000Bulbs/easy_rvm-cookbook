require 'serverspec'

set :backend, :exec

describe user('testuser') do
  it { should exist }
  it { should have_home_directory('/home/testuser') }
  it { should have_login_shell('/bin/bash') }
end
