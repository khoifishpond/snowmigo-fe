require 'rails_helper'

describe 'user info edit page' do
  describe 'edits' do
    before :each do
      login_with_oauth

      @user_attributes = { id: 5, attributes:
                          { name: 'Freddie Mercury', email: 'example@gmail.com',exp_level: nil,
                            ski_pass: nil, address: nil, ski_or_board: nil,
                            emergency_name: nil, emergency_number: nil
                        } }
      visit edit_user_path(@user_attributes[:id])
    end
  end
end
