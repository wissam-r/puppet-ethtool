ethtool::set_ring { 'eth0':
  interface => 'eth0',
  rx        => 1024,
  tx        => 1024,

}

############################################

each ($::real_interfaces) |$interface| { 
  ethtool::set_ring { $interface:
    interface => $interface,
    rx        => $::interfaces_buffers[$interface]['RX']['max_buffer'],    tx        => $::interfaces_buffers[$interface]['TX']['max_buffer'],
  }   
}
