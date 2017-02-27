Facter.add("real_interfaces") do
  real_interfaces = []
  setcode do
    Facter.value(:interfaces).split(',').each do |interface|
      if Facter.value(:networking)['interfaces'][interface]['mac']
        real_interfaces.push(interface)
      end	
  #    real_interfaces.push(interface)
    end 
    real_interfaces
  end
end
