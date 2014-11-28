module SearchEngineScrawler

  module ConcurrentHelper
    module_function

    def together(items, max = 5, &action)
      items.each_slice(max).collect do |slice|
        slice.collect { |c| Thread.new { action.call(c) } }
          .collect { |thread| thread.value  }
      end.flatten(2)
    end

  end

end
