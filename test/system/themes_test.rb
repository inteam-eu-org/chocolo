# frozen_string_literal: true

require 'application_system_test_case'

class ThemesTest < ApplicationSystemTestCase
  setup do
    @theme = Theme.create(name: 'test theme')
    @event = Event.create(properties: {
                            "kind": 'statement',
                            "texts": ['test']
                          })
    @event.themes << @theme

    visit root_path
    # Dealing with modal
    execute_script("$('#installModal').remove()")
  end

  test 'it shows a dialog when less than three players' do
    first('input.form-control').set('Alice')
    accept_alert do
      click_button 'Lancer le jeu'
    end
  end

  test 'adding players and starting the game' do
    # select theme
    # Adding players
    click_button 'Ajouter joueur'
    first('input.form-control').set('Alice')
    click_button 'Ajouter joueur'
    first('input.form-control').set('Bob')
    # Start game
    click_button 'Lancer le jeu'
    assert find('#event').text != ''
  end
end
