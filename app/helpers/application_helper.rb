module ApplicationHelper
  def display_title(title)
    title.blank? ? "Turbolinks" : title
  end
end
