class OpenWeatherService
  def self.get_weather(lat, lon)
    response = Faraday.get("https://api.openweathermap.org/data/2.5/onecall") do |f|
      f.params["appid"] = "5c5fe7d3d9e166cb296f315e26a7eb8d"
      f.params['lat'] = lat
      f.params['lon'] = lon
      f.params['exclude'] = 'minutely'
    end
    parsed = parse(response)
  end

  private

  # def self.connection
  #   conn = Faraday.new(url: 'http://www.mapquestapi.com')
  # end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
