# JustCars

JSON:API compliant API for managing Car offers.

Available resources:
* offers

See root document at http://localhost:3000 for a list of resources.

Supports filtering by partial matching, for example:

<http://localhost:3000/offers?filter[title]=Red%20Toyota%20Corolla>

will show you a list of Red Toyota Corollas.

# Requirements

* Ruby 2.6

# Installation

```bash
# Install gems
bundle install

# Setup database
rails db:setup

# Run server
rails server
```

# Testing
Tests are written in MiniTest.

```bash
rails test 
```
