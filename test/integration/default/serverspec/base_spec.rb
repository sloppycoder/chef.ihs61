require 'spec_helper'

# test kitchen does not support using Chef attribute in tests
# so the below are redundant of attributes of recipes.
ihs_home = '/opt/IBM/IHS/HTTPServer'
ihs_ver = '6.1'

if %w(redhat, centos).include?(os[:family])
  describe package('compat-db') do
    it { should be_installed }
  end

  describe package('compat-libstdc++-33') do
    it { should be_installed }
  end

  describe package('gsk7bas') do
    it { should be_installed }
  end
end

describe file(ihs_home) do
  it { should be_directory }
  it { should be_mode 755 }
end

describe command("#{ihs_home}/java/jre/bin/java -version") do
  its(:stdout) { should match(/IBM J9 VM/) }
end

describe command("#{ihs_home}/bin/versionInfo.sh") do
  its(:stdout) { should match(/IBM HTTP Server.*\n.*#{ihs_ver}/) }
end

describe command("sudo #{ihs_home}/bin/apachectl start") do
  its(:exit_status) { should eq 0 }
end

describe port(80) do
  it { should be_listening }
end

# ivt is a default web app that is installed when the profile is created
describe command('curl http://127.0.0.1:80') do
  its(:stdout) { should match(/IBM HTTP Server/) }
end
