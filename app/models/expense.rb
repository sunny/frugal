class Expense < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :amount, :date
  
  def amount= val
    # allow for french-style decimals
    val.gsub!(/,/, '.') if val
    super val
  end
end
