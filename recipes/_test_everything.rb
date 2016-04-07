user_account "testuser" do
  action      :create
  manage_home true
  shell       '/bin/bash'
end

rvm_application 'testapp' do
  user         'testuser'
  ruby_version '2.2'
end