module ApplicationHelper
  def exp_calc(food_item)
    day_count = food_item.expiration_date - Date.today
    if day_count < 1
      content_tag(:span, class: "expired") do
        "EXPIRED"
      end
    elsif day_count > 10
      content_tag(:span, class: "fresh") do
        "#{day_count.to_i} days left"
      end
    end
  end
end
