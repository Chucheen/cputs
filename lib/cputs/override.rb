module CPuts
    module Override

        private
        def cputs_override(message)
            CPuts::Functions.cputs(message, caller)
        end

        alias :puts :cputs_override
    end
end

include Override