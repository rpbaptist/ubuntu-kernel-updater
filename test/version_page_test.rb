gem "minitest"
require "minitest/autorun"

require_relative "../lib/version_page"

require "pry"

# Test the VersionPAge class
class VersionPageTest < Minitest::Test
  TYPES = %w(amd64 i386 armhf arm64 ppc64el s390x)

  def test_built
    page = VersionPage.new(
      File.expand_path("../files/BUILT.html", __FILE__)
    )
  end

  def test_list_types
    page = VersionPage.new(
      File.expand_path("../files/version_page.html", __FILE__)
    )
    assert_equal(page.list_types, TYPES)
  end
end
