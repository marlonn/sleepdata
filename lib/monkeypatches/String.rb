class String
  def holiday? # on timestamp as string

    if Holiday.where(date: Date.parse(self)).any?
      true
    else
      false
    end

  end
end
