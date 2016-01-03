
# require 'uri'
# URI.join(base, url).to_s

require 'nokogiri'
# require 'open-air'
require 'open-uri'

class ImgGet
  def initialize(input_url)
    @url = input_url
    img_run
  end

# doc = Nokogiri::HTML(open(@url))


  def img_run
    Nokogiri::HTML(open(@url)).xpath("//img/@src").each do |src|
      uri = URI.join( @url, src ).to_s
      File.open(File.basename(uri),'wb'){ |f| f.write(open(uri).read) }
    end
  end
end
