define ethtool::set_ring (
  $interface,
  $rx,
  $tx,
){
  include ethtool
  if !(is_integer($rx)) or !(is_integer($tx)) {
    fail("rx ${rx} or/and tx ${tx} value not integers")
  }
  if ($rx < 0) or ($tx < 0) {
    fail("rx ${rx} or/and tx ${tx} value not positive integers")
  }  
  if ( $interface in $facts['real_interfaces'] ) {
    if ( $rx != $::interfaces_buffers[$interface]['RX']['current_buffer']) {
      exec { "ethtool -G ${interface} rx ${rx}":
        path => "${ethtool::ethtool_path}",
      }
    }
    if ( $tx != $::interfaces_buffers[$interface]['TX']['current_buffer']) {
      exec { "ethtool -G ${interface} tx ${tx}":
        path => "${ethtool::ethtool_path}",
      }
    }
  }
}
