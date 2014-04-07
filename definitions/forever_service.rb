define :forever_service do

  template "/etc/init.d/#{params[:name]}" do
    source "init.d.erb"
    cookbook "forever"
    owner params[:user]
    group params[:group]
    mode "0755"
    variables({
      :name => params[:name],
      :user => params[:user],
      :group => params[:group],
      :path => params[:path],
      :log_dir => params[:log_dir],
      :command => params[:command],
      :script => params[:script],
      :script_options => params[:script_options],
      :env_options => params[:env_options],
      :description => params[:description] || params[:name]
    })
  end

  service params[:name] do
    supports :status => true, :restart => true
    action params[:action]
  end

end