#!/usr/bin/env ruby

require 'test/unit'
require 'json'
require 'tree'

module TestTree
  # Test class for the Tree node.
  class TestBranch < Test::Unit::TestCase
    def test_branch
      @branch = Tree::TreeNode.new_branch('Mike', 'Sara', 'Glen','Charlie')
      assert_equal(Tree::TreeNode, @branch.class, 'Branch is a node')
    end
  end

end

__END__
