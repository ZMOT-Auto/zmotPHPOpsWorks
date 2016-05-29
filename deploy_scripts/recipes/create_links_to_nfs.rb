# User and group for creating 
user = "deploy"
group = "apache"
mode = "0770"

node[:deploy].each do |application, deploy|
	node[:sites].each do |site|
		
		Chef::Log.info(`ls -la #{deploy[:deploy_to]}`)
		
		Chef::Log.info("Createing directory, if don't exisits")
		Chef::Log.info(`sudo mkdir -p #{site.link}`)
		Chef::Log.info(`sudo chown #{user}:#{group} #{site.link}`)
		Chef::Log.info(`sudo chmod #{mode} #{site.link}`)
		Chef::Log.info(`sudo chmod g+s #{site.link}`)
		Chef::Log.info("Createing symlink: sudo -H -u #{user} bash -c 'cd #{deploy[:deploy_to]}/current && ln -s #{site.link} ./#{site.name}/#{site.directory}")
		Chef::Log.info(`sudo -H -u #{user} bash -c 'cd #{deploy[:deploy_to]}/current && ln -s #{site.link} ./#{site.name}/#{site.directory}'`)
		raise "Symlink failed, server wonn't come up" unless $?.success?
	end
end 