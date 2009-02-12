#!/usr/bin/ruby

$:.unshift '../lib'

require 'test/unit'
require 'xmpp4r/rexmladdons'
require 'xmpp4r/list'
include Jabber

class PrivacyListTest < Test::Unit::TestCase
  def test_create
    l = List.new()
    assert_equal("list", l.name)
    assert_equal("<list/>", l.to_s)
  end
  
  def test_name
    l = List.new()
    l.list_name = 'invisible'
    assert_equal 'invisible', l.list_name
  end
  
  def test_item
    l = List.new()
    l.add_item('deny', 1, 'out')
    assert_equal '<list><item order=\'1\' action=\'deny\'><presence-out/></item></list>', l.to_s
    
    l.add_item('allow', 1, 'in')
    assert_equal '<list><item order=\'1\' action=\'deny\'><presence-out/></item><item order=\'1\' action=\'allow\'><presence-in/></item></list>', l.to_s
  end

  def test_import
    # q = IqQuery.new
    # assert_equal(IqQuery, q.class)
    # 
    # e = REXML::Element.new('query')
    # e.add_namespace('jabber:iq:roster')
    # # kind_of? only checks that the class belongs to the IqQuery class
    # # hierarchy. See IqQueryRosterTest#test_import for a more strict
    # # check.
    # assert_kind_of(IqQuery, IqQuery.import(e))
    # 
    # # Importing specific derivates is to be tested in the test case of the derivate
    # # (e.g. tc_iqqueryroster.rb)
  end
end
