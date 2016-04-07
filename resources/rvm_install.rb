resource_name :rvm_install

property :ruby_string, String, :name_attribute => true
property :user, String

default_action :install

action :install do
  rvm_exec(user, "autolibs disable")
  rvm_exec(user, "install #{ruby_string}")
end
