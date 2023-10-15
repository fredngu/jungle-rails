/// <reference types="cypress" />

describe('jungle app', () => {
  beforeEach(() => {
    cy.visit('/')
  })
  
  it("There is a product description on the page", () => {
    cy.get('.products article').first()
      .click();
    cy.get('.product-detail')
      .should('be.visible')
  })
  
})
