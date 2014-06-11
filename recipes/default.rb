#
# Cookbook Name:: puma_service
# Recipe:: default
#

if platform_family?("rhel")
  package "redhat-lsb" do
    action :install
  end
end

cookbook_file "/etc/init.d/puma" do
  source "puma"
  mode 0755
  owner "root"
  group "root"
end

template "/usr/local/bin/run-puma" do
  source "run-puma.erb"
  mode 0755
  owner "root"
  group "root"
  variables({
              :env => node[:puma_service][:env_hash]
            })
end

template "/usr/local/bin/run-pumactl" do
  source "run-pumactl.erb"
  mode 0755
  owner "root"
  group "root"
  variables({
              :env => node[:puma_service][:env_hash]
            })
end

template "/etc/puma.conf" do
  source "puma.conf.erb"
  mode 0444
  owner "root"
  group "root"
  variables({
              :puma_apps => node[:puma_service][:apps]
            })
end

service "puma" do
  init_command "/etc/init.d/puma"
  supports :start => true, :stop => true, :restart => true, :status => true
  action :enable
end


