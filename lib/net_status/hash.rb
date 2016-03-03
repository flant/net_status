class NetStatus::Hash
  module Mixin
    def net_status_ok?
      !(key? :error)
    end

    def net_status_ok!
      net_status_ok? ? self : raise NetStatus::Exception, self
    end
  end
end

::Hash.send(:include, NetStatus::Hash::Mixin)


