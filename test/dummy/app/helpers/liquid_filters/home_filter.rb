module LiquidFilters::HomeFilter

  def remove_whitespaces(string)
    string.to_s.gsub(/\s/, '')
  end
end