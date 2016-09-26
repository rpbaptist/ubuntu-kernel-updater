gem "minitest"
require "minitest/autorun"

require_relative "../lib/cpu_types"

require "pry"

# Test the CPUTypes class
class CPUTypesTest < Minitest::Test
  TYPES = %w(amd64 i386 armhf arm64 ppc64el s390x)

  def test_list
    list = CPUTypes.list(
      File.expand_path("../files/BUILT", __FILE__)
    )
    assert_equal(list, TYPES)
  end
end
