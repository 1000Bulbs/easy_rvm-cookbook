def trust_rvm_gpg_key(user)
  execute "trust RVM key for user '#{user}'" do
    environment "HOME" => "/home/#{user}"
    command     "gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3"
    user        user
  end
end

def rvm_exec(user_name, command)
  execute "Run rvm #{command} as '#{user_name}'" do
    environment "HOME" => "/home/#{user_name}"
    command     "$HOME/.rvm/bin/rvm #{command}"
    user        user_name
  end
end
