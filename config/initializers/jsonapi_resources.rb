JSONAPI.configure do |config|
  # Options are :none, :offset, :paged, or a custom paginator name
  config.default_paginator = :paged # default is :none

  config.default_page_size = 20 # default is 10
  config.maximum_page_size = 100 # default is 20
end