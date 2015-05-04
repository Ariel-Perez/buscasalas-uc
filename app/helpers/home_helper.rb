module HomeHelper
  def enumerate(array, final_connector, exceptions = [], exception_handler = '')
    text = ""
    n = array.length

    array.each_with_index do |item, index|
      text += item.to_s
      if index < n - 2
        text += ', '
      elsif index == n - 2 
        if exceptions.include? array[n - 1][0]
          text += ' ' + exception_handler + ' '
        else
          text += ' ' + final_connector + ' '
        end
      end
    end

    text
  end

  def disjunction(array)
    enumerate(array, 'o', ['O', 'o'], 'u')
  end

  def conjunction(array)
    enumerate(array, 'y', ['I', 'i', 'Y', 'y'], 'e')
  end
end
