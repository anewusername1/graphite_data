class SendStats
  attr_reader :statsd_client
  def initialize(statsd_host, statsd_port=8125)
    @statsd_client = Statsd.new(statsd_host, statsd_port)
  end

  # so far we only support hashes nested two deep, and not very well. But this
  # is a quick write up so I'm not too worried about it yet..
  def send_count(route_leader, stats_hash)
    stats_hash.each_pair do |key, value|
      if(stats_hash[key].is_a?(Hash))
        stats_hash[key].each_pair do |key2, value2|
          statsd_client.count("#{route_leader}.#{key}.#{key2}", value2)
          puts %{statsd_client.count("#{route_leader}.#{key}.#{key2}", #{value2.inspect})}
        end
      else
        statsd_client.count("#{route_leader}.#{key}", value)
        # puts %{statsd_client.count("#{route_leader}.#{key}", #{value.inspect})}
      end
    end
  end
end
