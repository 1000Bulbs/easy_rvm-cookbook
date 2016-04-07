resource_name :rvm_gem

property :gem, String, :name_attribute => true
property :user, String
property :ruby_string, String

default_action :install

action :install do
  rvm_do(user, ruby_string, "gem install #{gem}")
end
