module ApplicationHelper
  def price_format(integer)
    integer = integer.to_s
    change = ''
    if integer.nil?
      integer = '0'
    end
    if integer.length == 1
      change = "0#{integer}"
      integer = 0
    else
      change = integer[-2..-1]
      integer = integer.slice(0..-3)
    end
    "$#{integer}.#{change}"
  end
end
