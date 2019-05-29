class Node
  attr_reader :range, :left, :right, :max

  def initialize(range:, left:, right:, max: nil)
    @range = range
    @left = left
    @right = right
    @max = max || range.max
  end

  def include?(current)
    current.min >= range.min && current.min <= range.max && current.max <= range.max && current.max >= range.min
  end
end