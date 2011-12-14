class System
  def self.gather_stats
    system_data = {load: {}}
    if(OSArch.linux?)
      load_average = File.read('/proc/loadavg').gsub(',',' ').split
    elsif(OSArch.osx?)
      load_average = `w | head -n1 | cut -d":" -f4`.split
    end
    system_data[:load][:one_minute] = load_average[0]
    system_data[:load][:five_minute] = load_average[1]
    system_data[:load][:fifteen_minute] = load_average[2]
    system_data
  end
end
