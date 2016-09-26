require "open-uri"

# List the available CPU types for a kernel version
class CPUTypes
  class << self
    def list(url)
      types_from_file(open(url, "r")).reject do |type|
        type == "binary-headers" || type == nil
      end
    end

    private

    def types_from_file(file)
      file.each_line.map do |line|
        next unless line.start_with?("Status:")
        line.split(" ")[1]
      end
    end
  end
end
