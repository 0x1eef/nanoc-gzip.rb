# frozen_string_literal: true

require "nanoc/core/executor"
class Nanoc::Core::Executor
  module Patch
    def filter_for_filtering(filter_name)
      klass = Nanoc::Core::Filter.named!(filter_name)
      if klass.from_binary_or_text?
        klass.new(assigns)
      else
        super
      end
    end
  end
  prepend(Patch)
end
