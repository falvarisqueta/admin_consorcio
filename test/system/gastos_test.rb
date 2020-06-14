require "application_system_test_case"

class GastosTest < ApplicationSystemTestCase
  setup do
    @gasto = gastos(:one)
  end

  test "visiting the index" do
    visit gastos_url
    assert_selector "h1", text: "Gastos"
  end

  test "creating a Gasto" do
    visit gastos_url
    click_on "New Gasto"

    click_on "Create Gasto"

    assert_text "Gasto was successfully created"
    click_on "Back"
  end

  test "updating a Gasto" do
    visit gastos_url
    click_on "Edit", match: :first

    click_on "Update Gasto"

    assert_text "Gasto was successfully updated"
    click_on "Back"
  end

  test "destroying a Gasto" do
    visit gastos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gasto was successfully destroyed"
  end
end
