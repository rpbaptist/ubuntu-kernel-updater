module KernelPPA
  # Read a single version URL from the PPA
  class Version
    attr_reader :page

    def initialize(url)
      html = open(url).read
      @page = Nokogiri::HTML(html)
    end

    def package_links
      page.search("a").select { |link| link["href"].match(/.deb\z/) }
    end
  end
end
