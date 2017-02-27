class ethtool::install inherits ethtool {
  package { 'ethtool':
    ensure => 'present',
    name   => 'ethtool',
  }
}
