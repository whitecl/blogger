require 'rails_helper'

describe 'Adding a comment to a post' do
  def sign_in(user)
    visit login_path

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Login'
  end

  context 'when the input is valid' do
    it 'saves and displays the comment' do
      user = create(:user)
      post = create(:post)

      sign_in(user)

      visit post_path(post)

      expect(page).to have_text post.title

      expected_comment = 'The comment body'

      fill_in 'comment[body]', with: expected_comment
      click_button 'Create Comment'

      expect(page).to have_text expected_comment
    end
  end

  context 'when the input is invalid' do
    it 'displays an error message' do
      user = create(:user)
      post = create(:post)

      sign_in(user)

      visit post_path(post)

      click_button 'Create Comment'

      expect(page).to have_text "Body can't be blank"
    end
  end
end
