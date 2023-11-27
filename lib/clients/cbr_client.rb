class CbrClient
  def initialize
    @http_client = setup_http_client
  end

  def daily(date)
    response = @http_client.get "XML_daily.asp?date_req=#{format_date(date)}"
    response.body
  end

  def dynamic(start_date, end_date, currency_id)
    response = @http_client.get "XML_dynamic.asp?date_req1=#{format_date(start_date)}&date_req2=#{format_date(end_date)}&VAL_NM_RQ=#{currency_id}"
    response.body
  end

  private

  def format_date(date)
    date.strftime("%d/%m/%Y")
  end

  def setup_http_client
    Faraday.new(url: 'http://www.cbr.ru/scripts/')
  end
end
