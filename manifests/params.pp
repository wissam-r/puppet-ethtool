class ethtool::params {
  $available_value = [ 'current_buffer', 'max_buffer' ]
  $ring_values = 'max_buffer'
  case $facts['osfamily'] {
    'RedHat': {
      $ethtool_path = '/sbin/'
    }
    'Debian': {
      $ethtool_path = '/sbin/'
    }
    default: {
      fail("Module does not support ${facts['osfamily']}")
    }
  }
}
