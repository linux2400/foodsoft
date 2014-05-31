ActiveSupport.on_load(:after_initialize) do
  # We simulate the shared database by pointing to our own database.
  #   This allows running tests without additional database setup.
  #   But take care when designing tests using the shared database.
  SharedSupplier.establish_connection Rails.env.to_sym
  SharedArticle.establish_connection Rails.env.to_sym
  # hack for different structure of shared database
  SharedArticle.class_eval do
    alias_attribute :number, :order_number
    alias_attribute :updated_on, :updated_at
    def self.find_by_number(n)
      find_by_order_number(n)
    end
  end
end
