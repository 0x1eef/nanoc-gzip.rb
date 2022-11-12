# frozen_string_literal: true

class Nanoc::Gunzip::TextFilter < Nanoc::Filter
  identifier :gzip_text
  type text: :binary
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
  def run(content, options = {})
    gunzip(
      content,
      options[:level],
      options[:strategy]
    )
  end
end
