describe('Jungle Add to cart', () => {

  beforeEach(() => {
    cy.visit("http://localhost:3000/");
  });

  it("should visit root", () => {
    cy.visit("http://localhost:3000/");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });

  it("Updates the cart once 'add to cart' is clicked", () => {
    cy.get(".products article div .btn").first().click({ force: true });
    cy.get('#navbarSupportedContent .nav-link').should("include.text", "My Cart (1)");
  });


});