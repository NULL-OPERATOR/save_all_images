
# require 'uri'
# URI.join(base, url).to_s

require 'nokogiri'
require 'open-air'

class ImgGet
  def initialize(input_url)
    @url = input_url
    img_run
  end

  def img_run
    Nokogiri::HTML(open(@url)).xpath("//img/@src").each do |src|
      uri = URI.join( @url, src ).to_s
      File.open(File.basename(uri),'wb'){ |f| f.write(open(uri).read) }
    end
  end
end
