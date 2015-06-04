module TitleHelper

  def title(str)
    @title = str
  end

  def page_title
    if @title
      "#{@title} - Real Estate"
    else
      'Real Estate'
    end
  end

end
