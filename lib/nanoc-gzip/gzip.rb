# frozen_string_literal: true

require "nanoc"
module Nanoc::Gzip
  require "zlib"
  require_relative "gzip/filter"
  include Zlib

  ##
  # @param [String] content
  #  The contents of a file.
  #
  # @param [Integer] level
  #  The compression level.
  #  The default is 9 (Zlib::BEST_COMPRESSION).
  #
  # @param [Integer] strategy
  #  The compression strategy.
  #  The default is 0 (Zlib::DEFAULT_STRATEGY).
  #
  # @return [void]
  def gzip(content, level, strategy)
    level ||= BEST_COMPRESSION
    strategy ||= DEFAULT_STRATEGY
    GzipWriter.open(output_filename, level, strategy) { _1.write(content) }
  end
end
