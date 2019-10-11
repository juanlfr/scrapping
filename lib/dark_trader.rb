require 'rubygems'
require 'nokogiri' 
require 'open-uri'

def dark_trader


    page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

    abrevation = page.xpath('//td[@class="text-left col-symbol"]').find_all
    abrevation_array = abrevation.collect(&:text)


    price = page.xpath('//td[@class="no-wrap text-right"]/a').find_all
    price_arrray = price.collect(&:text).map!{|number| number.delete("$").to_f}


    hash_all = Hash[abrevation_array.zip(price_arrray)]

    return new_array = hash_all.split_into(abrevation_array.size)

end


Hash.class_eval do
    
    def split_into(divisions)
      count = 0
      inject([]) do |final, key_value|
        final[count%divisions] ||= {}
        final[count%divisions].merge!({key_value[0] => key_value[1]})
        count += 1
        final
      end
    end
  
end
 

dark_trader


    
