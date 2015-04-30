module Tree::Utils::BranchTool

  def self.included(base)
    base.extend(ClassMethods)
  end

  # Branch is a node that has chain with single child

  module ClassMethods

    def new_branch(arr)
      check_arguments(arr)
      top = arr.inject(nil) do |root ,n|
        root ? root.top_of_branch << new(n) : new(n)
      end
      top.root
    end

    def check_arguments(arr)
      arr.each do |n|
        raise ArgumentError, "Argument has forbidden class: #{n.class}" unless [Array, String, Integer].any? {|klass| n.is_a?(klass)}
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


  def branch_from_parents

  end

  def branch_till(node)

  end

  def reverse_branch

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

  def top_of_branch
    first_child ? first_child.top_of_branch : self
  end

end