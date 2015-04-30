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
      Tree::TreeNode.new_branch(['Mike', 'Mary', 'Jessie', 'Rust'])
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
      merged_branch = new_branch_a.merge_branch(['Mike', 'Mary', ['Jessie', "Hello, I'm Jessie"], 'Rust'])

      #* Mike
      # +---+ Mary
      #     |---+ Glen
      #          +---> Charlie
      #     +---+ Jessie
      #         +---> Rust

      assert_equal(Tree::TreeNode, merged_branch.class, 'Branch is a node')
      assert_equal('Mike', merged_branch.name, 'Mike')
      assert_equal('Mary', merged_branch.first_child.name, 'Child is Mary')
      assert_equal(['Glen', 'Jessie'], merged_branch.first_child.children.map(&:name), 'Grandchilds are Jessie and Glen')
      assert_equal("Hello, I'm Jessie", merged_branch.first_child.last_child.content, 'Content of Jessie')
    end

    def test_new_branch_with_nodes
      some_node = new_branch_a.merge_branch(['Mike', 'Mary', 'Jessie', 'Rust'])
      new_branch = Tree::TreeNode.new_branch(['Sara', 'Charlie', some_node, 'Stan'])

      # * Sara
      # +---+ Charlie
      #     +---+ Mike
      #         |---+ Mary
      #              |---+ Glen
      #                  +---> Charlie
      #              +---+ Jessie
      #                  +---> Rust
      #     +---> Stan

    end

  end

end

