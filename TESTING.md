# TESTING

## Prerequisites
Before starting any test, you should make sure you have installed the Puppet PDK.

Required gems are installed with `bundler`:
```
cd puppet-isync
pdk bundle install
```

Or just do an update:
```
cd puppet-isync
pdk bundle update
```

## Validation tests
Validation tests will check all manifests, templates and ruby files against syntax violations and style guides .

Run validation tests:
```
cd puppet-isync
pdk validate
```

## Unit tests
For unit testing we use [RSpec]. All classes, defined resource types and functions should have appropriate unit tests.

Run unit tests:
```
cd puppet-isync
pdk test unit
```

