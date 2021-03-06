require 'rails_helper'

RSpec.feature 'Recipe #Show', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'Henry', email: 'henry@gmail.com', password: 'kkkkkk')
    @recipe = Recipe.create(name: 'Curry', description: 'Very nice one', cooking_time: 10, preparation_time: 20,
                            user_id: @user.id)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Sign In'
    visit recipe_path(@recipe.id)
  end

  scenario 'show link to Back' do
    expect(page).to have_link 'Back'
  end

  scenario 'show Add Food button' do
    expect(page).to have_button 'Add Food'
  end

  scenario 'show recipe details on page' do
    expect(page).to have_content @recipe.name
    expect(page).to have_content @recipe.description
    expect(page).to have_content @recipe.cooking_time
    expect(page).to have_content @recipe.preparation_time
    expect(page).not_to have_content 'Cheese'
  end

  scenario 'show buttons on page' do
    expect(page).to have_button 'Generate Shopping List'
    expect(page).to have_button 'Add ingredient'
  end
end
