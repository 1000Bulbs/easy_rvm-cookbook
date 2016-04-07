resource_name :rvm_application

property :name, String, :name_attribute => true
property :user, String
property :ruby_version, String

default_action :install

action :install do
  install_user_rvm user

  rvm_install ruby_version do
    user new_resource.user
  end

  rvm_gemset new_resource.name do
    user         new_resource.user
    ruby_version new_resource.ruby_version
  end

  rvm_gem 'bundler' do
    user        new_resource.user
    ruby_string "#{ruby_version}@#{new_resource.name}"
  end

  rvm_exec(user, "wrapper #{ruby_version}@#{name} #{name} bundle")
end
