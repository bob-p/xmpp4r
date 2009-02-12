require 'xmpp4r/xmppelement'

module Jabber
  ##
  # A class used to build privacy lists
  #
  class List < XMPPElement
    name_xmlns 'list'
    force_xmlns true
    
    def list_name=(name)
      add_attribute('name', name)
    end
    
    def list_name
      attributes['name']
    end
    
    # TODO add value and type options
    def add_item(action, order, presence=nil, type=nil, value=nil)
      item = XMPPElement.new('item')
      item.add_attributes({'action' => action, 'order' => order})
      item.add_element('presence-in') if presence == 'in'
      item.add_element('presence-out') if presence == 'out'
      typed_add(item)
    end
  end
end
