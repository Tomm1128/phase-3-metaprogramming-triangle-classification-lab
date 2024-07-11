class Triangle
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def valid_triangle?
    sides = [side1, side2, side3]
    sides.all? { |side| side > 0 } && sides.permutation(3).all? { |a, b, c| a + b > c }
  end

  def kind
    raise TriangleError unless valid_triangle?
    if(side1 == side2 && side1 == side3)
      :equilateral
    elsif(side1 == side2 || side1 == side3 || side2 == side3)
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
  end
end
