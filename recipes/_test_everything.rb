user_account "testuser" do
  action      :create
  manage_home true
  shell       '/bin/bash'
end

install_user_rvm 'testuser'