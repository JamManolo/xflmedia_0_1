module ApplicationHelper

  def logo
    image_tag("favicon-05-rounded.gif", :alt => "XFL Media 0.1", :class => "round")
  end

  # Return a title on a per-page basis.
  def title
    base_title = "XFL Media Zero Point One"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
