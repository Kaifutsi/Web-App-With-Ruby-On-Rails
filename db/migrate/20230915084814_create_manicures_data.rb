class CreateManicuresData < ActiveRecord::Migration[6.1]
  def up
    Manicure.create(name: 'Классический маникюр', description: 'Профессиональный маникюр', price: 25.00)
    Manicure.create(name: 'Спа-маникюр', description: 'Маникюр с пузырями', price: 35.00)
    # Добавьте другие записи маникюра, если нужно
  end

  def down
    Manicure.destroy_all
  end
end
