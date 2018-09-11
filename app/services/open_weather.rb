require 'rubygems'
require 'httparty'
class OpenWeather
	include HTTParty

	base_uri "http://api.openweathermap.org/"
#
	def posts
		self.class.get ("/data/2.5/forecast?q=paris,fr&mode=json&units=metric&lang=fr&appid=#{ENV['WEATHER_KEY']}")
	end
#api key = 8f59043c8a7b69c797c2b9b1338987a2

 	def get_temperature(hour, mDate)

		open_weather = OpenWeather.new

		hash = open_weather.posts

		mHour = hour[11..12].to_i

		hash["list"].each_with_index do |mHash, index|

			if mDate ==  mHash["dt_txt"][0..9]

				if mHour <= mHash["dt_txt"][11..12].to_i

					mTemperature = mHash["main"]["temp_min"].to_s + "° C - " + mHash["weather"][0]["description"].to_s

					return mTemperature
				end
			end

		end
		return "Prévisions météo actuellement non disponible"
	end

end