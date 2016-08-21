require "nokogiri"
require "pry"

# Index a PPA from a URL and provides methods to access its content
class KernelPPA
  attr_reader :page

  def initialize(html)
    @page = Nokogiri::HTML(html)
  end

  # Return version numbers and remove trailing "/"
  def versions
    version_links.map { |link| link.text[0..-2] }
  end

  private

  # Select only the links going to v*.*
  def version_links
    page.search("a").select { |link| link["href"].match(/v\d+.\d+/) }
  end
end
