require_relative 'cputs/version.rb'
require_relative 'cputs/functions.rb'

module CPuts

    def self.override_puts
        require_relative 'cputs/override.rb'
    end

    def cputs(message)
        CPuts::Functions.cputs(message, caller)
    end

    def CPuts.set_preffix(preffix)
        CPuts::Functions.preffix preffix
    end

    def CPuts.set_suffix(suffix)
        CPuts::Functions.suffix suffix
    end

    def CPuts.set_preffix_and_suffix(*args)
        CPuts::Functions.preffix_and_suffix *args
    end

    alias :default_puts :puts

end

include CPuts