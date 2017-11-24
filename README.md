# BigReader

Extract files from `.big` archives. 
Big files contain assets that where used in games like Command & Conquer Generals.

## Installation

There is no extra installation instructions. Just download this repo and follow the useage

## Usage

To extract files from an `.big` archive just do:

```
# example.cr

BigReader.extract(File.open("example.big"))
```

Compile & run.

This will load all files from the archive and put them in the directory as defined in their name.

## Contributing

1. Fork it ( https://github.com/lirith-engine/big-reader/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [Rinkana](https://github.com/Rinkana) Max Berends - creator, maintainer
