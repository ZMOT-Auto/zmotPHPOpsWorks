node[:deploy].each do |application, deploy|
  template File.join(deploy[:deploy_to], "shared","app.env") do
    source "app.env.erb"
    mode 0770
    owner deploy[:user]
    group deploy[:group]
    variables(
      :environment => OpsWorks::Escape.escape_double_quotes(deploy[:environment_variables])
    )
    only_if {File.exists?("#{deploy[:deploy_to]}/shared")}
  end
end

node[:deploy].each do |application, deploy|
  template File.join(deploy[:deploy_to], "shared","perlvars.env.pl") do
    source "perlvars.env.erb"
    mode 0770
    owner deploy[:user]
    group deploy[:group]
    variables(
      :environment => OpsWorks::Escape.escape(deploy[:environment_variables], /\'/, "\\\'")
    )
    only_if {File.exists?("#{deploy[:deploy_to]}/shared")}
  end
end

node[:deploy].each do |application, deploy|
  template File.join(deploy[:deploy_to], "shared","phpvars.env.php") do
    source "phpvars.env.erb"
    mode 0770
    owner deploy[:user]
    group deploy[:group]
    variables(
      :environment => OpsWorks::Escape.escape(deploy[:environment_variables], /\'/, "\\\'")
    )
    only_if {File.exists?("#{deploy[:deploy_to]}/shared")}
  end
end
