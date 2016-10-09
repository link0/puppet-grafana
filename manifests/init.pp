#
class grafana (

  $package_manage = $grafana::params::package_manage,
  $package_ensure = $grafana::params::package_ensure,
  $package_name   = $grafana::params::package_name,

  $service_manage = $grafana::params::service_manage,
  $service_ensure = $grafana::params::service_ensure,
  $service_name   = $grafana::params::service_name,

) inherits grafana::params {

  validate_bool($package_manage)
  validate_re($package_ensure, '^installed|absent|latest$')
  validate_string($package_name)

  validate_bool($service_manage)
  validate_re($service_ensure, '^running|stopped$')
  validate_string($service_name)

  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'grafana::begin': } ->
  class { '::grafana::install': } ->
  class { '::grafana::config': } ~>
  class { '::grafana::service': } ->
  anchor { 'grafana::end': }

}
