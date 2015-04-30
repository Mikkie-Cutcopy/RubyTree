module Tree::Utils::BranchTool

  def self.included(base)
    base.extend(ClassMethods)
  end

  # Branch is a node that has chain with single child

  module ClassMethods

    def new_branch(arr)
      check_arguments(arr)
      top = arr.inject(nil) do |top ,n|
          new_node = if n.is_a?(Array)
                         new(*n)
                     elsif n.is_a?(Tree::TreeNode)
                         n.is_root? ? n : (raise RuntimeError, "The node #{n} should be root" )
                     else
                         new(n)
                     end
          top ? top << new_node : new_node
      end
      top.root
    end

    def check_arguments(arr)
      arr.each do |n|
        raise ArgumentError, "Argument has forbidden class: #{n.class}" unless [Array, String, Integer, Tree::TreeNode].any? {|klass| n.is_a?(klass)}
      end
    end

  end

  def merge_branch(arr)
    self.class.check_arguments(arr)
    merge(self.class.new_branch(arr))
  end

  def merge_branch!(arr)
    self.class.check_arguments(arr)
    merge!(self.class.new_branch(arr))
  end


  def deattach_branch(node)

  end

  def branch?
    if @children.length == 1
      @children.first.branch?
    elsif @children.empty?
      root? ? false : true
    else
      false
    end
  end

end