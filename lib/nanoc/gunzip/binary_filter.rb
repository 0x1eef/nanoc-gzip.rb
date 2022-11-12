# frozen_string_literal: true

class Nanoc::Gunzip::BinaryFilter < Nanoc::Filter
  identifier :gzip_binary
  type text: :binary
  include Nanoc::Gunzip

  ##
  # @param [String] file
  #  The path to a file.
  #
  # @param [Hash] options
  # @option options [Integer] :level
  #  The compression level represented by an integer between 0, and 9. <br>
  #  The default is 9 (Zlib::BEST_COMPRESSION).
  # @option options [Integer] :strategy
  #  The compression strategy represented by an integer between 0, and 4. <br>
  #  The default is 0 (Zlib::DEFAULT_STRATEGY).
  #
  # @return [String]
  #  Returns the contents of a file as a compressed string.
  def run(file, options = {})
    gunzip(
      File.binread(file),
      options[:level],
      options[:strategy]
    )
  end
end
