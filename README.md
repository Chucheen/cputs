# Cputs - Custom Puts

##Description

*Custom Puts* is as it's name says, a customized puts command that will always remember you where is the  following message coming from:

```
Firm Load (0.2ms)  SELECT `table2`.* FROM `table2` INNER JOIN `table1` ON `table2`.`id` = `table2`.`table2_id` WHERE `table2`.`foreign_key_id` = 509122938901 AND (table1.update_at is null)
Firm Load (0.2ms)  SELECT `table2`.* FROM `table2` INNER JOIN `table1` ON `table2`.`id` = `table2`.`table2_id` WHERE `table1`.`user_id` = 668972  [["user_id", 668972]]
Project4 - The name is still to decide. user jgutierrezc
   (0.3ms)  SELECT COUNT(*) FROM `table1` WHERE `table1`.`id` = 166561 AND `table1`.`field_x` = 1
   (0.2ms)  SELECT COUNT(*) FROM `table1` WHERE `table1`.`id` = 166561 AND `table1`.`field_x` = 1 AND `table1`.`field2` = 0
```

As you can see, the message `Project4 - The name is still to decide. user jgutierrezc` is a puts message coming from who knows what file.

With **cputs** this message can be changed to this:

```
/Users/JGutierrezC/AwesomeProjects/the_best/app/controllers/randoms_controller at line 2: Project4 - The name is still to decide. user jgutierrezc
```

Or using a preffix and/or suffix to make the output more noticeable:

```
---------------------------->
/Users/JGutierrezC/AwesomeProjects/the_best/app/controllers/randoms_controller at line 2: Project4 - The name is still to decide. user jgutierrezc
<----------------------------
```

This way, you'll **NEVER** lose your output messages and hopefully they won't make it to production.
###Sometimes even the Gems are printing to your console. Find out which gem is doing that by using `CPuts.override_puts` :)

## Installation

Add this line to your application's Gemfile:

```
gem 'cputs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cputs

## Usage

To use this gem you need to require 'cputs' and configure it as you want to:

```
require 'cputs'

# to set a message preffix for every output:
CPuts.set_preffix('<---------')

# to set a message suffix for every output:
CPuts.set_suffix('--------->')

# to set the same preffix and suffix for every output:
CPuts.set_preffix_and_suffix('-----------------')

# to set different preffix and suffix in a single method for every output:
CPuts.set_preffix_and_suffix('----------->', '<-----------')


```

And use cputs command to output your message:

```
cputs 'Project4 - The name is still to decide. user jgutierrezc'
```

Or if you want to replace the usual `puts` command for `cputs` functionality:

```
CPuts.override_puts
```

And then use puts:

```
puts 'Project4 - The name is still to decide. user jgutierrezc'
```

The output will be as follows (previously defined preffix and suffix):

```
----------------------------> /Users/JGutierrezC/AwesomeProjects/the_best/app/controllers/randoms_controller at line 2: Project4 - The name is still to decide. user jgutierrezc <----------------------------
```

### When using rails

Add `puts` to your Gemfile and then add a cputs initializer:

```
# config/initializers/cputs.rb

require 'cputs'

CPuts.override_puts
CPuts.set_preffix_and_suffix("----------------->\n", "\n<-----------------")

```

Restart your console...
Done!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JGutierrezC/cputs. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct. Remember to test with rspec before :)


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

