require "net_status/version"

require "net_status/exception"
require "net_status/hash"

module NetStatus
  def self.normalize(net_status, context: nil)
    code = net_status[:code]
    code ||= net_status[:error] if net_status.include? :error
    net_status[:data] ||= {}
    net_status[:message] = I18n.t [:net_status, context, code].join('.'), [:net_status, code].join('.'), **net_status[:data], raise: true rescue nil
    net_status
  end
end
