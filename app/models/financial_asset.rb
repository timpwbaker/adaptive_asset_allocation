class FinancialAsset < ApplicationRecord
  before_save :retrieve_financial_data

  def retrieve_financial_data
    self.monthly_performance_data = 
      QuandlDataRetriever.new(self.quandl_address).monthly_data
  end

  def six_month_momentum
    QuandlMonthlyDataCalculator.new(self.monthly_performance_data).six_month_momentum
  end
end
