require "bitfield_flags/version"
require 'bitfields'

module BitfieldFlags
  def self.included(base)
    base.class_eval do
      include Bitfields

      class << self
        attr_accessor :bitfield_flags

        # set up bitfield with scopes for the given names
        def scoped_flags(flag_names, column_name = :flags)
          self.bitfield_flags ||= {}
          self.bitfield_flags[column_name] = flag_names.each_with_object({}) { |f, h| h[f.to_sym] = (1 << flag_names.index(f)) }
          bitfield column_name, bitfield_flags[column_name].invert.merge(scopes: false)

          bitfield_flags[column_name].keys.each do |flag|
            scope flag,                 -> { where(flag_set(flag, column_name: column_name)) }
            scope "not_#{flag}".to_sym, -> { where(flag_not_set(flag, column_name: column_name)) }
          end
        end

        def flags_set(*flags, column_name: :flags)
          "(#{column_name} & #{bitval_for(*flags, column_name: column_name)}) != 0"
        end
        alias_method :flag_set, :flags_set

        def flags_not_set(*flags, column_name: :flags)
          "(#{column_name} & #{bitval_for(*flags, column_name: column_name)}) = 0"
        end
        alias_method :flag_not_set, :flags_not_set

        def bitval_for(*flags, column_name: :flags)
          flags.inject(0) { |bitval, flag| bitval | bitfield_flags[column_name][flag] }
        end
      end

    end
  end
end
