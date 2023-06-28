# frozen_string_literal: true

class Nanoc::Gzip::Filter < Nanoc::Filter
  identifier :gzip
  type [:binary, :text] => :binary
  include Nanoc::Gzip

  ##
  # @param [String] str
  # @return [String]
  def run(str, options = {})
    gunzip(
      item.binary? ? File.binread(str) : str,
      options[:level],
      options[:strategy]
    )
  end
end
