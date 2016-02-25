module NetStatus::Exception::Mixin
  def net_status
    { error: :error, code: :exception, message: self.message, data: { backtrace: self.backtrace } }
  end

  def net_status_short
    net_status.dup.tap do |res|
      if res[:data]
        res[:data] = res[:data].dup
        res[:data].delete(:backtrace)
      end
    end
  end
end

::Exception.send(:include, NetStatus::Exception::Mixin)
