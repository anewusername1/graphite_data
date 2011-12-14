class Network
  def self.gather_stats
    network_data = {packets: {}}
    raw_stats = `netstat -s`
    ip_packets_received = raw_stats.scan(/ip:[\s]+([\d]+) total packets received/i)[0][0].to_i
    ip_packets_delivered = raw_stats.scan(/([\d]+) requests sent out/)[0][0].to_i
    ip_packets_delivered = raw_stats.scan(/([\d]+) packets sent from this host/)[0][1].to_i if(ip_packets_delivered == 0)
    network_data[:packets][:received] = ip_packets_received
    network_data[:packets][:delivered] = ip_packets_delivered
    network_data
  end
end
