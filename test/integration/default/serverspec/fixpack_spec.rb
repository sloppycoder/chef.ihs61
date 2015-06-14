require 'spec_helper'

# test kitchen does not support using Chef attribute in tests
# so the below are redundant of attributes of recipes.
ihs_home = '/opt/IBM/IHS/HTTPServer'
ihs_ver = '6.1.0.47'

describe command("#{ihs_home}/bin/versionInfo.sh") do
  its(:stdout) { should match(/IBM HTTP Server.*\n.*#{ihs_ver}/) }
end
