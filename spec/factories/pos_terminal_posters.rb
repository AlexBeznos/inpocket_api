FactoryGirl.define do
  factory :pos_terminal_poster, class: 'PosTerminal::Poster' do
    account "MyString"
    access_token "MyString"
    waiter_id 1
  end
end
