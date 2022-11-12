# frozen_string_literal: true

require "nanoc"

module Nanoc::Gunzip
  require "zlib"
  require_relative "gunzip/text_filter"
  require_relative "gunzip/binary_filter"
  include Zlib

  ##
  # Compresses a string, and writes the string to "Nanoc::Filter#output_filename".
  #
  # @param [String] content
  #  The contents of a file.
  #
  # @param [Integer] level
  #  The compression level represented by an integer between 0, and 9. <br>
  #  The default is 9 (Zlib::BEST_COMPRESSION).
  #
  # @param [Integer] strategy
  #  The compression strategy represented by an integer between 0, and 4. <br>
  #  The default is 0 (Zlib::DEFAULT_STRATEGY).
  #
  # @return [void]
  def gunzip(content, level, strategy)
    level ||= BEST_COMPRESSION
    strategy ||= DEFAULT_STRATEGY
    GzipWriter.open(output_filename, level, strategy) { _1.write(content) }
  end
end
