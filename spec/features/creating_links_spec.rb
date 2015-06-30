feature 'Creating links' do
  scenario 'I can create a new link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.zombo.com'
    fill_in 'title', with: 'This is ZomboCom'
    click_button 'Create link'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('This is ZomboCom')

    end

  end

end
