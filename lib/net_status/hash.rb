module NetStatus
  class Hash
    module Mixin
      def net_status_normalize(**kwargs)
        NetStatus.normalize(self, **kwargs)
      end

      def net_status_ok?
        !(key? :error)
      end

      def net_status_ok!
        raise NetStatus::Exception, self unless net_status_ok?
        self
      end
    end
  end
end

::Hash.send(:include, NetStatus::Hash::Mixin)


