# frozen_string_literal: true

require_relative "setup"

class FilterTest < Test::Unit::TestCase
  module BinaryItem
    def item
      OpenStruct.new("binary?" => true)
    end
  end

  module TextItem
    def item
      OpenStruct.new("binary?" => false)
    end
  end

  def teardown
    FileUtils.rm(filter.output_filename)
  end

  def test_text_item
    filter.extend(TextItem).run("hello world")
    assert_match %r{^application/(x-)?gzip}, file(filter.output_filename)
  end

  def test_binary_item
    bin_file = File.join(__dir__, "bin_test_file")
    File.binwrite(bin_file, "hello world")
    filter.extend(BinaryItem).run(bin_file)
    assert_match %r{^application/(x-)?gzip}, file(filter.output_filename)
  ensure
    FileUtils.rm(bin_file)
  end

  private

  def filter
    @filter ||= Nanoc::Filter.named!(:gzip).new
  end

  def file(path)
    %x(file -bi #{path}).chomp
  end
end
