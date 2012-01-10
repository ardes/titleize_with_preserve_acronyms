module TitleizeWithPreserveAcronyms
  module Inflector
    def self.extended inflector
      inflector.module_eval do
        alias_method :original_titleize, :titleize
      end
    end
    
    def titleize word
      word = inflections.titleize_preserve_acronyms ? titleize_with_preserve_acronyms(word) : original_titleize(word)
      inflections.titleize_exceptions.each {|titleized, exception| word.gsub!(titleized, exception) }
      word
    end
    
    def titleize_with_preserve_acronyms word 
      acronymns = word.scan(/\b[A-Z\d]+\b/)
      word = original_titleize word
      acronymns.each {|a| word.gsub!(original_titleize(a), a) }
      word
    end
  end
  
  module Inflections
    attr_accessor :titleize_preserve_acronyms
    
    def titleize_exception rule
      titleize_exceptions[ActiveSupport::Inflector.original_titleize(rule)] = rule
    end
    
    def titleize_exceptions
      @titleize_exceptions ||= {}
    end
  end
end

ActiveSupport::Inflector.extend TitleizeWithPreserveAcronyms::Inflector
ActiveSupport::Inflector::Inflections.send :include, TitleizeWithPreserveAcronyms::Inflections