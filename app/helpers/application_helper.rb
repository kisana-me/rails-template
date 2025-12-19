module ApplicationHelper
  def full_title(str)
    base = "App"
    return base if str.blank?
    "#{str} | #{base}"
  end
end
