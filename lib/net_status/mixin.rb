module NetStatus::Exception::Mixin
  def status
    { error: :error, code: :exception, message: self.message, data: { backtrace: self.backtrace } }
  end
end

::Exception.send(:include, NetStatus::Exception::Mixin)