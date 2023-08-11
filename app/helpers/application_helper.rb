module ApplicationHelper
  def format_message_date(date)
    if date.today?
      time_ago_in_words(date) + " ago"
    else
      date.strftime("%B %d %Y")
    end
  end
end
