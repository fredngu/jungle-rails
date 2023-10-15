/// <reference types="cypress" />

describe('jungle app', () => {
  beforeEach(() => {
    cy.visit('/')
  })
  
  it("There should add one item to the cart", () => {
    cy.get('.products')
      .find('.btn')
      .click({ multiple: true, force: true })
    cy.get('.nav-item.end-0 a.nav-link')
      .contains('My Cart (2)')
      .should('exist')
  })
  
})
