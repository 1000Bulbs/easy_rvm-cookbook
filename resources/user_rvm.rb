resource_name :user_rvm

property :user, String, :name_attribute => true
property :default_ruby, String, :default => ''

default_action :install

action :install do
  trust_rvm_gpg_key(user)

  package "curl"

  execute "install RVM" do
    environment "HOME" => "/home/#{new_resource.user}"
    command     "curl -sSL https://get.rvm.io | bash -s stable"
    user        new_resource.user
  end

  unless default_ruby.empty?
    rvm_install default_ruby do
      user new_resource.user
    end
  end
end
