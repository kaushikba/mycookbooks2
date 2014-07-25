# Download Repo and install for new relic[Server Monitoring]
targetFile = "http://repo.zabbix.com/zabbix/2.2/rhel/6/x86_64/zabbix-release-2.2-1.el6.noarch.rpm"


# Install rpm
#rpm_package "new-relic server agent" do
#	source targetFile
#end

# Start install newrelic server agent
yum_package "zabbix zabbix-agent" do
	action :install
end


# Start new relic service
service "zabbix_agent" do
	Chef::Log.info("starting service")
	supports :restart => true, :status => true
	action [:enable, :start]  
end
