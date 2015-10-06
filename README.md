# attospec

lightweight testing

## Installing

On the command line:

       $ gem install attospec


In your gemfile

        gem "attospec"

and then

        $ bundle install


## Usage

```ruby

include Attospec

does? { 1 == 1 }

is? { 0.zero? }
```
