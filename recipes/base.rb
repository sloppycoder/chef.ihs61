#
# Cookbook Name:: ihs61
# Recipe:: base
#
#
CACHE = Chef::Config['file_cache_path']

attribs = node['ihs61']

ihs_home = attribs['ihs_install_location']

unless ::File.exist? ihs_home

  # install the rpm packages required to IBM JRE
  package ['compat-db', 'compat-libstdc++-33'] do
    arch 'i686'
    action :install
    only_if { platform?('redhat', 'centos', 'amazon', 'scientific') }
  end

  unpack_dir = ::File.join(CACHE, 'ihs_installer')

  directory unpack_dir do
    action :create
  end

  installer =  CACHE + '/' + attribs['ihs_installer']
  if installer.start_with?('file://')
    installer = installer.sub(%r{^file://}, '')
  else
    remote_file installer do
      action :create_if_missing
      mode 0644
      source attribs['file_server_url'] + attribs['ihs_installer']
    end
  end

  execute "untar #{installer}" do
    umask 0022
    command "tar zxf #{installer} -C #{unpack_dir}"
  end

  response_file = ::File.join(CACHE, 'responsefile_ihs61.txt')
  template response_file do
    source 'installer_responsefile.erb'
    variables(
      install_location: ihs_home,
      ihs_host_name: node['hostname']
    )
  end

  execute 'install ihs' do
    cwd unpack_dir + '/IHS'
    user attribs['user']
    umask 0022
    command "./install -options #{response_file}  -silent "
  end
end
