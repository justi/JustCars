require 'test_helper'

class OffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offer = offers(:one)
  end

  test "should get index" do
    get offers_url, as: :jsonapi
    assert_response :success
  end

  test "should create offer" do
    assert_difference('Offer.count') do
      post offers_url,
      params: {
        data: {
          type: 'offers',
          attributes: {
            title: @offer.title,
            content: @offer.content,
            price: @offer.price
          }
        }
      },
      as: :json, headers: {
        'Accept' => JSONAPI::MEDIA_TYPE,
        'Content-Type' => JSONAPI::MEDIA_TYPE
      }
    end

    assert_response :created
  end

  test "should show offer" do
    get offer_url(@offer), as: :jsonapi
    assert_response :success
  end

end
