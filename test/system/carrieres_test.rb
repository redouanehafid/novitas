require "application_system_test_case"

class CarrieresTest < ApplicationSystemTestCase
  setup do
    @carriere = carrieres(:one)
  end

  test "visiting the index" do
    visit carrieres_url
    assert_selector "h1", text: "Carrieres"
  end

  test "creating a Carriere" do
    visit carrieres_url
    click_on "New Carriere"

    fill_in "Email", with: @carriere.email
    fill_in "Message", with: @carriere.message
    fill_in "Nom", with: @carriere.nom
    fill_in "Sujet", with: @carriere.sujet
    click_on "Create Carriere"

    assert_text "Carriere was successfully created"
    click_on "Back"
  end

  test "updating a Carriere" do
    visit carrieres_url
    click_on "Edit", match: :first

    fill_in "Email", with: @carriere.email
    fill_in "Message", with: @carriere.message
    fill_in "Nom", with: @carriere.nom
    fill_in "Sujet", with: @carriere.sujet
    click_on "Update Carriere"

    assert_text "Carriere was successfully updated"
    click_on "Back"
  end

  test "destroying a Carriere" do
    visit carrieres_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Carriere was successfully destroyed"
  end
end
