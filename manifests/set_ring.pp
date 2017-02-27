define ethtool::set_ring (
  String $interface,
  Integer[0, 65535] $rx,
  Integer[0, 65535] $tx,
){

  include ::ethtool

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
