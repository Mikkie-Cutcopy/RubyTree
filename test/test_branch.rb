#!/usr/bin/env ruby

require 'test/unit'
require 'json'
require 'tree'

module TestTree
  # Test class for the Tree node.
  class TestBranch < Test::Unit::TestCase

    def new_branch_a
      Tree::TreeNode.new_branch(['Mike', 'Mary', 'Glen', 'Charlie'])
    end

    def new_branch_b
      Tree::TreeNode.new_branch(['Mike', 'Mary', 'Jassie', 'Rust'])
    end

    def test_new_branch
      node = new_branch_a

      #* Mike
      #+---+ Mary
      #    +---+ Glen
      #        +---> Charlie

      assert_equal(Tree::TreeNode, node.class, 'Branch is a node')
      assert_equal('Mike', node.name, 'Mike')
      assert_equal('Mary', node.first_child.name, 'Child is Mary')
      assert_equal('Glen', node.first_child.first_child.name, 'Grandchild is Glen')
    end

    def test_merge_branches
      merged_branch = new_branch_a.merge_branch(['Mike', 'Mary', 'Jassie', 'Rust'])

      # +---+ Mary
      #     |---+ Glen
      #          +---> Charlie
      #     +---+ Jassie
      #         +---> Rust

      assert_equal(Tree::TreeNode, merged_branch.class, 'Branch is a node')
      assert_equal('Mike', merged_branch.name, 'Mike')
      assert_equal('Mary', merged_branch.first_child.name, 'Child is Mary')
      assert_equal(['Glen', 'Jassie'], merged_branch.first_child.children.map(&:name), 'Grandchilds are Jassie and Glen')
    end

  end

end

