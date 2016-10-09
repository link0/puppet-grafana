#
class grafana::install inherits grafana {

  if $grafana::package_manage {

    if (!defined(Apt::Source['package-cloud'])) {
      apt::source { 'package-cloud':
        location   => 'https://packagecloud.io/grafana/stable/debian/',
        repos      => 'main',
        key        => {
          'id'     => '418A7F2FB0E1E6E7EABF6FE8C2E73424D59097AB',
          'server' => 'pgp.mit.edu',
        },
      }
    }

    package { 'grafana':
      ensure  => $grafana::package_ensure,
      name    => $grafana::package_name,
      require => Apt::Source['package-cloud'],
      notify  => Exec['apt_update'],
    }
  }

}
