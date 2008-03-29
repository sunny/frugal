class HomeController < ApplicationController
  layout 'expenses'
    
  def index
    @title = 'Frugal !'
    @categories = Category.find :all, :include => :expenses, :order => 'categories.title'
    @monthly_expenses_by_category = monthly_expenses_by_category
  end

  private
  
    def monthly_expenses_by_category
      expenses = {}
      each_month do |date|
        sums = @categories.collect { |c| c.sum_of_expenses_in_month(date) }
        total = sums.sum
        sums.push total
        expenses[date] = sums
      end
      expenses.sort.reverse
    end
    
    # Loop around each month where there is an expense
    def each_month
      @all_expenses ||= Expense.find(:all, :order => 'date')
      return if @all_expenses.empty?
      date = @all_expenses.first.date.beginning_of_month
      end_date = @all_expenses.last.date
      while date <= end_date
        yield date
        date += 1.month
      end
    end
end
