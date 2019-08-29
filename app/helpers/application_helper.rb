module ApplicationHelper
  # Returns the full title per-page
  def full_title(page_title = '')
    base_title = 'Deployed'
    if page_title.empty?
      base_title
    else
      page_title
    end
  end
end
