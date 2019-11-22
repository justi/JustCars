class OfferResource < JSONAPI::Resource
  attributes :title, :content, :price

  filters :title, :content, :price

  # example: filter[content]=radio
  filter :content, apply: ->(records, value, _options) {
    records.where('offers.content LIKE :query', query: "%#{value[0]}%")
  }
end


