class System
  def self.gather_stats
    system_data = {load: {}}
    if(File.exists?('/proc/loadavg'))
      load_average = File.read('/proc/loadavg').gsub(',',' ').split
    else
      # for now, assume that if /proc/loadavg doesn't exist, we're on a mac
      # TODO: turn this into a real check or skip mac completely
      load_average = `w | head -n1 | cut -d":" -f4`.split
    end
    system_data[:load][:one_minute] = load_average[0]
    system_data[:load][:five_minute] = load_average[1]
    system_data[:load][:fifteen_minute] = load_average[2]
    system_data
  end
end
