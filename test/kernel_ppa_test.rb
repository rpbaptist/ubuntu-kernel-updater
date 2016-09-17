gem "minitest"
require "minitest/autorun"
require "open-uri"

require_relative "../lib/kernel_ppa"

# Test the KernelPPA class
class KernelPPATest < Minitest::Test
  TEST_HTML = open(File.expand_path("../files/mainline.html", __FILE__)).read
  PPA_VERSIONS = %w(
    v4.6-rc7-wily
    v4.6-rc7-yakkety
    v4.6-yakkety
    v4.6.1-yakkety
    v4.6.4
    v4.7
    v4.7-rc6
    v4.7-rc6-yakkety
    v4.7.1
    v4.8-rc1
  ).freeze

  def test_versions
    ppa = KernelPPA.new(TEST_HTML)
    assert_equal(ppa.versions.sort, PPA_VERSIONS.sort)
  end
end
