# Every So Often
Perform an action every so often

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     every_so_often:
       github: dscottboggs/every_so_often
   ```

2. Run `shards install`

## Usage

```crystal
require "every_so_often"

include EverySoOften

every 1.second do
  puts Time.local
end
```

See also [the documentation](https://dscottboggs.github.io/every_so_often/EverySoOften.html#every%28duration%3ATime%3A%3ASpan%2Cerrors%3AChannel%28Exception%29%3F%3Dnil%2C%26action%3A-%3ENil%29%3ANoReturn-instance-method)

## Contributing

1. Fork it (<https://github.com/dscottboggs/every_so_often/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [D. Scott Boggs](https://github.com/dscottboggs) - creator and maintainer
