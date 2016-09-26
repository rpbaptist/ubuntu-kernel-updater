gem "minitest"
require "minitest/autorun"

require_relative "../lib/kernel_ppa/version"

# Test the KernelPPA class
class VersionTest < Minitest::Test
  def test_packages
    url = "http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.7/"

  end
end
