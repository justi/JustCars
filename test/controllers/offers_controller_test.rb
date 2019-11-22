require 'test_helper'

class OffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offer = offers(:one)
    @second_offer = offers(:two)
  end

  test "should get index" do
    get offers_url, as: :jsonapi
    assert_response :success
    assert_equal JSONAPI::MEDIA_TYPE, response.content_type

    json = JSON.parse(response.body)
    offers_json = json["data"]

    assert_equal 3, offers_json.size
  end

  test "should filter elements in index by title" do
    get offers_url, as: :jsonapi, params: { filter: { title: @offer.title } }
    assert_response :success
    assert_equal JSONAPI::MEDIA_TYPE, response.content_type

    json = JSON.parse(response.body)
    offer_json = json["data"].first

    assert_equal 1, json["data"].size
    assert_equal @offer.id.to_s, offer_json['id']
  end

  test "should filter elements in index by partial content" do
    get offers_url, as: :jsonapi, params: { filter: { content: third_word(@second_offer.content)} }
    assert_response :success
    assert_equal JSONAPI::MEDIA_TYPE, response.content_type

    json = JSON.parse(response.body)
    offer_json = json["data"].first

    assert_equal 1, json["data"].size
    assert_equal @second_offer.content.to_s, offer_json['attributes']['content']
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
    assert_equal JSONAPI::MEDIA_TYPE, response.content_type
  end

  test "shouldn't create offer for insufficient params" do
    assert_no_difference('Offer.count') do
      post offers_url,
           params: {
               data: {
                   type: 'offers',
                   attributes: {
                       title: nil,
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

    assert_response :unprocessable_entity
    assert_equal JSONAPI::MEDIA_TYPE, response.content_type
  end

  test "should show offer" do
    get offer_url(@offer), as: :jsonapi
    assert_response :success
    assert_equal JSONAPI::MEDIA_TYPE, response.content_type
  end

  private
  def third_word(sentence)
    sentence.split(/\W+/).third
  end
end
