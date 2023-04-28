describe('Jungle Product Details Page', () => {

  beforeEach(() => {
    cy.visit("http://localhost:3000/");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });

  // test that users can navigate from the home page to the product details page
  it("Shows product/show", () => {
    cy.get(".products article").first().click();
    cy.get('.btn').contains("Add");
  });

});