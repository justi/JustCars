require 'test_helper'

class OffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offer = offers(:one)
  end

  test "should get index" do
    get offers_url, as: :json
    assert_response :success
  end

  test "should create offer" do
    assert_difference('Offer.count') do
      post offers_url, params: { offer: { content: @offer.content, price: @offer.price, title: @offer.title } }, as: :json
    end

    assert_response 201
  end

  test "should show offer" do
    get offer_url(@offer), as: :json
    assert_response :success
  end

end
