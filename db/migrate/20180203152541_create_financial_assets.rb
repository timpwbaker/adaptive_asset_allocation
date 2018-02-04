class CreateFinancialAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :financial_assets do |t|
      t.string :ticker_code
      t.string :quandl_address
      t.jsonb :monthly_performance_data 
      t.timestamps
    end
    add_index :financial_assets, :monthly_performance_data, using: :gin
  end
end
