# frozen_string_literal: true

class Nanoc::Gunzip::Filter < Nanoc::Filter
  identifier :gzip
  type [:binary, :text] => :binary
  include Nanoc::Gunzip

  ##
  # @param [String] content
  #  The contents of a file
  #
  # @param options (see Nanoc::Gunzip::BinaryFilter#run)
  # @option options (see Nanoc::Gunzip::BinaryFilter#run)
  #
  # @return [String]
  #  Returns the contents of a file as a compressed string.
  def run(str, options = {})
    gunzip(
      item.binary? ? File.binread(str) : str,
      options[:level],
      options[:strategy]
    )
  end
end
