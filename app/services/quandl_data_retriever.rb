class QuandlDataRetriever
  attr_reader :quandl_address

  def initialize(quandl_address)
    @quandl_address = quandl_address
  end

  def monthly_data
    JSON.parse(open(monthly_data_address).read)
  end

  def monthly_data_address
    quandl_address + "?api_key=#{api_key}&collapse=monthly"
  end

  def api_key
    ENV.fetch('QUANDL_API_KEY')
  end
end
