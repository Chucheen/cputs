module CPuts
    module Functions
        attr :preffix, :suffix

        def self.cputs(message, caller)
            matcher = caller.first.match(/^(.*)\:(\d+)/)
            file, line = matcher.captures[0..1] unless matcher.nil?
            default_puts "#{@preffix}#{file} at line #{line}: #{message}#{@suffix}"
        end

        def self.preffix(preffix)
            @preffix = preffix
        end

        def self.suffix(suffix)
            @suffix = suffix
        end

        def self.preffix_and_suffix(*args)
            case args.length
                when 1
                    @preffix = args[0]
                    @suffix = args[0]
                when 2
                    @preffix = args[0]
                    @suffix  = args[1]
            end
        end

    end
end