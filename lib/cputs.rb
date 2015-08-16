require_relative 'cputs/version.rb'
require_relative 'cputs/functions.rb'
##
# This module represents the bridge between CPuts functionality and the user

module CPuts

    ##
    # The main method to print (puts) a message with the *preffix* (if set) *File* (that's making the call) *Line* (of the file) and *Suffix* (if set)
    # :args: message

    def cputs(message)
        CPuts::Functions.cputs(message, caller)
    end

    ##
    # Override the usual *puts* method to always use
    # cputs instead.

    def self.override_puts
        require_relative 'cputs/override.rb'
    end

    ##
    # Sets the preffix for the output

    def CPuts.set_preffix(preffix)
        CPuts::Functions.preffix preffix
    end

    ##
    # Sets the suffix for the output

    def CPuts.set_suffix(suffix)
        CPuts::Functions.suffix suffix
    end

    ##
    # Sets both the preffix and suffix for the output

    def CPuts.set_preffix_and_suffix(*args)
        CPuts::Functions.preffix_and_suffix *args
    end

    alias :default_puts :puts

end

include CPuts