#!/usr/bin/env ruby

require 'test/unit'
require 'json'
require 'tree'

module TestTree
  # Test class for the Tree node.
  class TestBranch < Test::Unit::TestCase
    def new_branch_test
      @branch = Tree::TreeNode.new_branch('Mike', 'Sara', 'Glen','Charlie')
      assert_equal('Hello', @branch.class, 'Branch is a node')
    end
  end

end

__END__
