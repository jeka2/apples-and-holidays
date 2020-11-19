require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each do |key, value|
    value << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  supply_array.each do |s|
    unless holiday_hash[season][holiday_name] == nil
      holiday_hash[season][holiday_name] << s
    else
      holiday_hash[season][holiday_name] = [s]
    end
  end
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  arr = []
  holiday_hash[:winter].each do |holiday, supply|
    supply.each { |item| arr << item }
  end
  arr
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, ot|
    puts "#{season.to_s.capitalize}:"
    ot.each do |holiday, stuff|
      item_string = ""
      stuff.each do |item| 
        item_string += "#{item}, " 
      end
      puts "  #{symbol_to_string(holiday)}: #{item_string.chop.chop}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_holidays = Array.new
  holiday_hash.each do |season, ot|
    ot.each do |holiday, stuff|
      stuff.each do |item|
        bbq_holidays << holiday if item == "BBQ"
      end
    end
  end
  bbq_holidays
end

def symbol_to_string(symbol)
  arr = symbol.to_s.split('_')
  return_arr = []
  arr.each do |el|
    return_arr << el.capitalize
  end
  return_arr.join(' ')
end







