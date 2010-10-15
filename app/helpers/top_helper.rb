module TopHelper
  def stars(num)
    num.times do
      @star = @star.to_s + "★"
    end

    return @star
  end
end
