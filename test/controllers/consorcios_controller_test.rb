require 'test_helper'

class ConsorciosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consorcio = consorcios(:one)
  end

  test "should get index" do
    get consorcios_url
    assert_response :success
  end

  test "should get new" do
    get new_consorcio_url
    assert_response :success
  end

  test "should create consorcio" do
    assert_difference('Consorcio.count') do
      post consorcios_url, params: { consorcio: {  } }
    end

    assert_redirected_to consorcio_url(Consorcio.last)
  end

  test "should show consorcio" do
    get consorcio_url(@consorcio)
    assert_response :success
  end

  test "should get edit" do
    get edit_consorcio_url(@consorcio)
    assert_response :success
  end

  test "should update consorcio" do
    patch consorcio_url(@consorcio), params: { consorcio: {  } }
    assert_redirected_to consorcio_url(@consorcio)
  end

  test "should destroy consorcio" do
    assert_difference('Consorcio.count', -1) do
      delete consorcio_url(@consorcio)
    end

    assert_redirected_to consorcios_url
  end
end
