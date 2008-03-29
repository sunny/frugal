class Category < ActiveRecord::Base
  has_many :expenses, :order => 'date desc'
  
  def sum_of_expenses_in_month(date)
    expenses.inject(0) { |acc, e| e.date.same_month?(date) ? acc + e.amount : acc }
  end
end
