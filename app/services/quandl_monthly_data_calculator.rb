class QuandlMonthlyDataCalculator
  attr_reader :monthly_json_data

  def initialize(monthly_json_data)
    @monthly_json_data = monthly_json_data
  end

  def six_month_momentum
    if data_point_count > 5
      ((100/six_months_ago_price) * current_price - 100).round(2)
    else
      ((100/furthest_past_price) * current_price - 100).round(2)
    end
  end

  private

  def data_point_count
    monthly_json_data["dataset"]["data"].count
  end

  def furthest_past_price
    monthly_json_data["dataset"]["data"][data_point_count - 1][1]
  end

  def current_price
    monthly_json_data["dataset"]["data"][0][1]
  end

  def six_months_ago_price
    monthly_json_data["dataset"]["data"][5][1]
  end
end
