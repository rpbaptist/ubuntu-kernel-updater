gem "minitest"
require "minitest/autorun"
require_relative "../lib/updater"

class UpdaterTest < Minitest::Test
  def test_call
  end

  def test_current_version
    updater = Updater.new

    assert_equal(updater.current_version, "4.7.4")
  end
end
