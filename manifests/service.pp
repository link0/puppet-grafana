#
class grafana::service inherits grafana {

  if $grafana::service_manage {
    service { 'grafana':
      ensure => $grafana::service_ensure,
      name   => $grafana::service_name,
    }
  }

}
