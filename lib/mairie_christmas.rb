require 'rubygems'
require 'nokogiri' 
require 'open-uri'

def get_townhall_name(townhall_url)

    name_commune = Nokogiri::HTML(open(townhall_url))

    names = name_commune.xpath('//div/main/section[1]/div/div/div/h1').text

    return names
end


def get_townhall_urls
    specific_url = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html")).xpath('//a[@class="lientxt"]/@href')
         #PAGE DE CHAQUE MAIRIE DANS LE TABLEAU PAGE
    townhall_url = specific_url.map {|x| "https://www.annuaire-des-mairies.com" + x.text[1..-1]
            }
    return townhall_url
end



def get_townhall_email(townhall_url)


    commune = Nokogiri::HTML(open(townhall_url))

     get_mail = commune.xpath('//div/main/section[2]/div/table/tbody/tr[4]/td[2]').text

     return get_mail

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


  
def perform

    mails= []
    name = []


        get_townhall_urls.each do |x|

           mails << get_townhall_email(x)
           name << get_townhall_name(x)

        end

           hash_all = Hash[name.zip(mails)]

           new_array = hash_all.split_into(name.size)
       
        return new_array


end


perform

