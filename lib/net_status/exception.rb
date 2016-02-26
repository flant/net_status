class NetStatus::Exception < Exception
  def initialize(net_status={})
    @net_status = net_status
    @net_status[:error] ||= :error
    super()
  end

  def net_status
    @net_status.dup.tap do |res|
      res[:data] = (res[:data] || {}).dup
      res[:data][:backtrace] ||= self.backtrace
    end
  end

  def message
    net_status_short.to_s
  end
end
