resource_name :install_user_rvm

property :user_name, String, :name_attribute => true

default_action :install

action :install do
  trust_rvm_gpg_key(user_name)

  package "curl"

  execute "install RVM" do
    environment "HOME" => "/home/#{user_name}"
    command     "curl -sSL https://get.rvm.io | bash -s stable"
    user        user_name
  end
end
