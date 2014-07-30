module LiquidFilters::WithExtraRegisterFilter

  def append_register_message(text)
    message = @context.registers[:message]
    text + message
  end
end