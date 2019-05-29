require 'set'
class IntervalTree

  attr_reader :root

  def initialize(intervals)
    intervals.sort_by! { |r| [r.min, r.max] }
    @root = construct(intervals)
  end

  def search(q)
    q = q.is_a?(Range) ? q : (q..q)
    return if q.first > q.last
    results = Set.new
    search_nodes(q, root, results)
    results
  end

  private

  def construct(ranges)
    return nil if ranges.empty?
    median = (ranges.length - 1 ) / 2
    range = ranges[median]

    left = construct(ranges.slice(0, median))
    right = construct(ranges[(median + 1)..-1])
    array = [range, left, right].compact

    Node.new(
      range: range,
      left: left,
      right: right,
      max: array.map(&:max).max 
    )
  end

  def search_nodes(q, node, results)
    return if node.nil?

    left = node.left
    right = node.right

    search_nodes(q, left, results) if left && (q.min <= left.max)

    results << q if !node.include?(q) 

    search_nodes(q, right, results) if right && (q.min <= right.max)

    results << q if !node.include?(q)
  end
end