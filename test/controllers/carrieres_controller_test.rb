require 'test_helper'

class CarrieresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carriere = carrieres(:one)
  end

  test "should get index" do
    get carrieres_url
    assert_response :success
  end

  test "should get new" do
    get new_carriere_url
    assert_response :success
  end

  test "should create carriere" do
    assert_difference('Carriere.count') do
      post carrieres_url, params: { carriere: { email: @carriere.email, message: @carriere.message, nom: @carriere.nom, sujet: @carriere.sujet } }
    end

    assert_redirected_to carriere_url(Carriere.last)
  end

  test "should show carriere" do
    get carriere_url(@carriere)
    assert_response :success
  end

  test "should get edit" do
    get edit_carriere_url(@carriere)
    assert_response :success
  end

  test "should update carriere" do
    patch carriere_url(@carriere), params: { carriere: { email: @carriere.email, message: @carriere.message, nom: @carriere.nom, sujet: @carriere.sujet } }
    assert_redirected_to carriere_url(@carriere)
  end

  test "should destroy carriere" do
    assert_difference('Carriere.count', -1) do
      delete carriere_url(@carriere)
    end

    assert_redirected_to carrieres_url
  end
end
