
# BC: in AS2.2 Inflector was namespaced in AS
inflector_module = defined?(Inflector) ? Inflector : ActiveSupport::Inflector

inflector_module.module_eval do
  def titleize_with_preserve_acronyms(word)
    acronymns = word.scan(/\b[A-Z\d]+\b/)
    word = titleize_without_preserve_acronyms(word)
    acronymns.each {|a| word.gsub!(titleize_without_preserve_acronyms(a), a) }
    word
  end
  alias_method_chain :titleize, :preserve_acronyms
end