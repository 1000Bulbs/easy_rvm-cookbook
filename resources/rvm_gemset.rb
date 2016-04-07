resource_name :rvm_gemset

property :name, String, :name_attribute => true
property :user, String
property :ruby_version, String

default_action :install

action :install do
  execute "create gemset #{ruby_version}@#{name} for user #{user}" do
    environment "HOME" => "/home/#{new_resource.user}"
    command     "$HOME/.rvm/bin/rvm #{ruby_version} do $HOME/.rvm/bin/rvm gemset create #{new_resource.name}"
    user        new_resource.user
  end
end
