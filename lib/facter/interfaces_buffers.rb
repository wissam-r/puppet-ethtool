Facter.add("interfaces_buffers") do
  interfaces_buffers = {}
  setcode do
    Facter.value(:real_interfaces).each do |interface|
      interfaces_buffers[interface] = {}
      interfaces_buffers[interface]['RX'] = {}
      interfaces_buffers[interface]['TX'] = {}
      interfaces_buffers[interface]['RX']['max_buffer'] = Facter::Core::Execution.exec("ethtool -g #{interface} | grep RX: | awk '{print $2}'").split(/\n+/).first.to_i
      interfaces_buffers[interface]['TX']['max_buffer'] = Facter::Core::Execution.exec("ethtool -g #{interface} | grep TX: | awk '{print $2}'").split(/\n+/).first.to_i
      interfaces_buffers[interface]['RX']['current_buffer'] = Facter::Core::Execution.exec("ethtool -g #{interface} | grep RX: | awk '{print $2}'").split(/\n+/).last.to_i
      interfaces_buffers[interface]['TX']['current_buffer'] = Facter::Core::Execution.exec("ethtool -g #{interface} | grep TX: | awk '{print $2}'").split(/\n+/).last.to_i
    end
    interfaces_buffers
  end
end
