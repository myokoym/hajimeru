require "stringio"
require "hajimeru/command"
require "hajimeru/version"

class CommandTest < Test::Unit::TestCase
  def setup
    @command = Hajimeru::Command.new
    @stdout_string = ""
    @stderr_string = ""
    stdout_io = StringIO.new(@stdout_string)
    stderr_io = StringIO.new(@stderr_string)
    $stdout = stdout_io
    $stderr = stderr_io
  end

  def teardown
    $stdout = STDOUT
    $stderr = STDERR
  end

  def test_version
    @command.version
    assert_equal(<<-END_OF_FILE, @stdout_string)
#{Hajimeru::VERSION}
    END_OF_FILE
  end
end
