class NetStatus::Hash
  module Mixin
    def net_status_ok?
      !(key? :error)
    end

    def net_status_ok!
      raise NetStatus::Exception, self unless net_status_ok?
    end
  end
end

::Hash.send(:include, NetStatus::Hash::Mixin)


