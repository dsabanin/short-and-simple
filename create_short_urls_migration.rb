class CreateShortUrls < ActiveRecord::Migration
  def self.up
    create_table :short_urls do |t|
      t.column :short_url,    :string
      t.column :long_url,     :string
      t.column :created_at,   :datetime
    end
    add_index  :short_urls, :short_url
  end

  def self.down
    drop_table :short_urls
  end
end
