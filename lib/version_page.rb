require "open-uri"
require "nokogiri"

class VersionPage
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def built

    html = open("#{url}/BUILT").read
  end

  def list_types
    types = Typelist.new()
    binding.pry
  end
end
