# time.strftime( string ) => string
#
# Format meaning:
# 
#   %a - The abbreviated weekday name (``Sun'')                          # Commons formats:
#   %A - The  full  weekday  name (``Sunday'')                           #   1   31/12/1999 23:59
#   %b - The abbreviated month name (``Jan'')                            #   2   31 de Diciembre del 2001
#   %B - The  full  month  name (``January'')                            #   3   31/Dic/1999
#   %c - The preferred local date and time representation                #   4   Lunes, 31 de Diciembre del 2001
#   %d - Day of the month (01..31)                                       #   5   31/Diciembre/1999
#   %H - Hour of the day, 24-hour clock (00..23)                         #   6   Lunes, 31/Dic/2001
#   %I - Hour of the day, 12-hour clock (01..12)                         #   7   31/Diciembre/1999 23:59
#   %j - Day of the year (001..366)                                      #   8   31-Dic-07
#   %m - Month of the year (01..12)                                      #   9   31/Dic/1999 23:59
#   %M - Minute of the hour (00..59)                                     #   10  31/Dic
#   %p - Meridian indicator (``AM''  or  ``PM'')                         #   11  Lunes, 31/Diciembre/2001
#   %S - Second of the minute (00..60)                                   #   12  Lunes, 31/Dic/2001 23:59
#   %U - Week  number  of the current year,                              
#           starting with the first Sunday as the first                  
#           day of the first week (00..53)                               
#   %W - Week  number  of the current year,                              
#           starting with the first Monday as the first                  
#           day of the first week (00..53)                               
#   %w - Day of the week (Sunday is 0, 0..6)                             
#   %x - Preferred representation for the date alone, no time            
#   %X - Preferred representation for the time alone, no date            
#   %y - Year without a century (00..99)                                 
#   %Y - Year with century
#   %Z - Time zone name
#   %% - Literal ``%'' character
# 
#    t = Time.now
#    t.strftime("Printed on %m/%d/%Y")   #=> "Printed on 04/09/2003"
#    t.strftime("at %I:%M%p")            #=> "at 08:56AM"


Time::DATE_FORMATS[:alpha] = "%d/%b/%Y %H:%M" # 31/Dic/1999 23:59
# Time::DATE_FORMATS[:beta] = "%d/%b/%Y %H:%M" # 31/Dic/1999 23:59
Time::DATE_FORMATS[:gamma] = "%d/%B/%Y" # 31/Dic/1999


