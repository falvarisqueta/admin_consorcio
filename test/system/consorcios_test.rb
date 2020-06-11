require "application_system_test_case"

class ConsorciosTest < ApplicationSystemTestCase
  setup do
    @consorcio = consorcios(:one)
  end

  test "visiting the index" do
    visit consorcios_url
    assert_selector "h1", text: "Consorcios"
  end

  test "creating a Consorcio" do
    visit consorcios_url
    click_on "New Consorcio"

    click_on "Create Consorcio"

    assert_text "Consorcio was successfully created"
    click_on "Back"
  end

  test "updating a Consorcio" do
    visit consorcios_url
    click_on "Edit", match: :first

    click_on "Update Consorcio"

    assert_text "Consorcio was successfully updated"
    click_on "Back"
  end

  test "destroying a Consorcio" do
    visit consorcios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Consorcio was successfully destroyed"
  end
end
