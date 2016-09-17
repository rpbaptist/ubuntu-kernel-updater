require "open-uri"
require_relative "kernel_ppa"

# The updater provides a command line interface to select the kernel files to
# download.
class Updater
  attr_reader :ppa, :release_candidates, :downgrade

  # Provide the PPA url if you want a different one. No guarantees it will work.
  # Set downgrade to true if you want versions lower than current system version
  # Set release_candidates to true if you want to see release candidates
  def initialize(url: DEFAULT_URL, downgrade: false, release_candidates: false)
    @downgrade = downgrade
    @release_candidates = release_candidates
    html = open(url).read
    @ppa = KernelPPA.new(html)
  end

  # `uname -r` returns the system version which has a lot more digits than a
  # listed version number.
  # The regex will only get the first 3 or 2 version digits.
  # Finally it needs to be prefixed with a v
  # Example: 4.2.1 or 4.2
  def system_version
    @system_version ||= begin
      version = `uname -r`
      semantic_version = version.match(/(^\d+.\d+.\d+|^\d+.\d+)/)
      "v#{semantic_version}"
   end
  end

  def available_upgrade_versions
    ppa.versions.select { |number| number > system_version }
  end

  def call
    puts available_upgrade_versions
    puts "\nWhich version would you like to download?"
    puts "Your version is: #{system_version}"
    version = gets.chomp
    puts "Okay, getting version #{version}"
  end
end
