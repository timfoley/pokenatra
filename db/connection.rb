require 'pg'
require 'active_record'
require 'pry'
require 'haml'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "pokenatra"
)

if defined? Sinatra
	after do
	  ActiveRecord::Base.connection.close
	end
end
