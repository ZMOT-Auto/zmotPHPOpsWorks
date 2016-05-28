include_recipe 'deploy'

node[:deploy].each do |application, deploy|

  if deploy[:application_type] == 'php'
    Chef::Log.debug("Skipping PHP apps")
    next
  end

  opsworks_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  opsworks_deploy do
    app application
    deploy_data deploy
  end

end
