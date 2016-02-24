class NetStatus::Exception < Exception
  attr_reader :net_status

  def initialize(message_or_net_status=nil)
    self.net_status = (message_or_net_status.nil? or message_or_net_status.is_a? String) ?
        message_or_net_status :
        { error: :error, code: :exception, message: message_or_net_status, data: { backtrace: self.backtrace } }
    self.net_status[:data] ||= {}
    self.net_status[:data][:backtrace] ||= self.backtrace
  end

  def message
    self.net_status.to_s
  end
end