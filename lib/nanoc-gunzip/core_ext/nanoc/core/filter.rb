require "nanoc/core/filter"
class Nanoc::Core::Filter
  def self.from_binary_or_text?
    return false unless @from.is_a?(Array)
    @from.sort == %i[binary text]
  end
end
