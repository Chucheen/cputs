module CPuts
    module Functions
        class Decorators

            attr_writer :preffix, :suffix

            def preffix
                @preffix ||= Decorators.default_preffix
                "#{"#{formatted_time} " if formatted_time}#{@preffix}"
            end

            def suffix
                @suffix ||= Decorators.default_suffix
            end

            def self.default_preffix
                "----------------->"
            end

            def self.default_suffix
                ''
            end

            def self.default_time_format
                '%Y-%m-%dT%H:%M:%S'
            end

            def add_time_to_preffix(format=nil)
                begin
                    @format = format
                    return unless @format
                    Time.now.strftime(@format)
                    raise Exception.new('') if @format == ''
                rescue Exception => ex
                    @format = Decorators.default_time_format
                    print "Warning: Format #{format} is wrong. Please refer to http://apidock.com/ruby/DateTime/strftime"
                end
            end

            private
            def formatted_time
                Time.now.strftime(@format) if @format
            end
        end

        def self.cputs(message, caller)
            matcher = caller.first.match(/^(.*)\:(\d+)/)
            file, line = matcher.captures[0..1] unless matcher.nil?
            default_puts "#{decorator.preffix}#{file} at line #{line}: #{message}#{decorator.suffix}"
        end

        def self.preffix(preffix)
            decorator.preffix = preffix
        end

        def self.suffix(suffix)
            decorator.suffix = suffix
        end

        def self.preffix_and_suffix(*args)
            case args.length
                when 1
                    decorator.preffix = args[0]
                    decorator.suffix = args[0]
                when 2
                    decorator.preffix = args[0]
                    decorator.suffix = args[1]
            end
        end

        def self.timestamp(format)
            decorator.add_time_to_preffix(format)
        end

        def self.decorator
            @decorator ||= Decorators.new
        end

    end
end