module PagesHelper

  def page_title
    default = "Convenient Article List"
    if @page_title.nil?
      "#{default}"
    else
      "#{default} | #{@page_title}"
    end
  end

end
