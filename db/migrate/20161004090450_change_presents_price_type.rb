class ChangePresentsPriceType < ActiveRecord::Migration[5.0]
  def self.up
    connection.execute(%q{
      alter table presents
      alter column price
      type integer using cast(price as integer)
    })
  end

  def self.down
    connection.execute(%q{
      alter table presents
      alter column price
      type integer using cast(price as string)
    })
  end
end
