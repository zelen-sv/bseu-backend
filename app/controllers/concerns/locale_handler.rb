module LocaleHandler
  def translate_in_locale(locale = :ru, data = [])
    data.map { |item| item.translation_for(locale) }
  end
end
