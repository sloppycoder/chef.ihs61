# there are some long lines so be it
# rubocop:disable Metrics/LineLength

default['ihs61']['file_server_url'] = 'http://some_server/'

default['ihs61']['ihs_ver'] = '6.1.0.0'
default['ihs61']['ihs_installer'] = "ihs_installer_#{default['ihs61']['ihs_ver']}.tar.gz"
default['ihs61']['ihs_install_location'] = '/opt/IBM/IHS/HTTPServer'

# recipes to installing updater and apply fixpack are just empty wrapper
# around recipes in cookbook was61nd, thus the attribute names too
default['was61']['updater_ver'] = '7.0.0.37'
default['was61']['updater_installer'] = "was_update_installer_#{default['was61']['updater_ver']}.tar.gz"
default['was61']['updater_home'] = '/opt/IBM/IHS/UpdateInstaller'
default['was61']['updater_non_root'] = 'false'

default['was61']['fixpack_ver'] = '47'
default['was61']['fixpack_tar'] = "ihs_fp#{default['was61']['fixpack_ver']}.tar"
default['was61']['updater_package_dir'] = "#{default['was61']['updater_home']}/maintenance/"
default['was61']['fixpack_product_location'] = '/opt/IBM/IHS/HTTPServer'

# rubocop:enable Metrics/LineLength
