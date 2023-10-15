/// <reference types="cypress" />

describe('jungle app', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('displays the title', () => {
    cy.get('.hero h1').should('have.text', 'The Jungle')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  
  
})
