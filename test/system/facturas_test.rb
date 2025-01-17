require "application_system_test_case"

class FacturasTest < ApplicationSystemTestCase
  setup do
    @factura = facturas(:one)
  end

  test "visiting the index" do
    visit facturas_url
    assert_selector "h1", text: "Facturas"
  end

  test "creating a Factura" do
    visit facturas_url
    click_on "New Factura"

    click_on "Create Factura"

    assert_text "Factura was successfully created"
    click_on "Back"
  end

  test "updating a Factura" do
    visit facturas_url
    click_on "Edit", match: :first

    click_on "Update Factura"

    assert_text "Factura was successfully updated"
    click_on "Back"
  end

  test "destroying a Factura" do
    visit facturas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Factura was successfully destroyed"
  end
end
