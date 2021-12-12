require "./src/every_so_often"

include EverySoOften
every 1.second do
  puts Time.local
end
