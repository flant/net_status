class NetStatus::Exception < Exception
  attr_reader :net_status

  def initialize(message_or_net_status=nil)
    @net_status = (message_or_net_status.nil? or message_or_net_status.is_a? String) ?
        { error: :error, code: :exception, message: message_or_net_status, data: { backtrace: self.backtrace } } :
        message_or_net_status
    @net_status[:data] ||= {}
    @net_status[:data][:backtrace] ||= self.backtrace
    super()
  end
  
  def net_status_short
    net_status.dup.tap do |res|
      if res[:data]
        res[:data] = res[:data].dup
        res[:data].delete(:backtrace)
      end
    end
  end

  def message
    net_status_short.to_s
  end
end
