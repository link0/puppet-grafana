#
class grafana::params {

  $package_manage = true
  $package_ensure = installed
  $package_name = 'grafana'

  $service_manage = true
  $service_ensure = running
  $service_name = 'grafana-server'

}
