#!/usr/bin/env ruby

require 'test/unit'
require 'json'
require 'tree'

module TestTree
  # Test class for the Tree node.
  class TestBranch < Test::Unit::TestCase
    def test_branch
      @node = Tree::TreeNode.new_branch('Mike', 'Mary', 'Glen','Charlie')
      assert_equal(Tree::TreeNode, @node.class, 'Branch is a node')
      assert_equal('Mike', @node.name, 'Mike')
      assert_equal('Mary', @node.first_child.name, 'Child is Mary')
      assert_equal('Glen', @node.first_child.first_child.name, 'Grandchild is Glen')
    end
  end

end

