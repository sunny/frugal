# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def html_money(val)
    str = "%.2f" % val.to_f
    els = str.split('.')
    "#{els.first}<span class='dot'>.</span><span class='decimals'>#{els.last}</span>"
  end
end

class Time
  MONTH_NAMES = %w{ nil Janvier Février Mars Avril Mai Juin Juillet Août Septembre Octobre Novembre Décembre }.freeze
  
  def same_month?(t)
    year == t.year and month == t.month
  end
  def monthName
    Time::MONTH_NAMES[month]
  end
end
