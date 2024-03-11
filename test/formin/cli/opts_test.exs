defmodule Formin.Cli.OptsTest do

  use ExUnit.Case

  import ExUnit.CaptureIO

  alias Formin.Cli

  describe "#config/0" do
    test "returns data" do
      assert Cli.Opts.config()
    end
  end

  describe "#version/0" do
    test "returns a value" do
      assert Cli.Opts.version()
    end
  end

  describe "#main/1 misc" do
    test "parses empty argv" do
      assert Cli.Opts.main([])
    end

    test "parses version flag" do
      result = capture_io(fn -> Cli.Opts.main(~w[--version]) end)
      assert result =~ "formin"
    end

    test "parses help flag" do
      result = capture_io(fn -> Cli.Opts.main(~w[--help]) end)
      assert result =~ "formin"
    end

    test "parses shortport option" do
      result = Cli.Opts.main(~w[-p 2000])
      assert result.options.port == 2000
    end

    test "parses longport option" do
      result = Cli.Opts.main(~w[--port 2000])
      assert result.options.port == 2000
    end
  end

  describe "#main/1 route" do
    test "route lane" do
      result = Cli.Opts.main(~w(--routes post:path[fifo=file]))
      assert result
    end
  end

end

