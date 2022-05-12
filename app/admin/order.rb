ActiveAdmin.register Order do
  actions :all, except: [:new, :create]
  permit_params :subtotal, :total, :created_at, :user_id, :status,
                order_items: [:id, :quantity, :product_id, :unit_price, :total]

  index do
    selectable_column
    id_column
    column :created_at
    column :user
    column :status
    column 'Итого', :subtotal
    column 'Изделия', :order_items
    actions
  end

  filter :created_at
  filter :status
  filter :subtotal

  show do
    panel "Детали заказа" do
      table_for order.order_items do
        column :product
        column 'Цена', :unit_price
        column 'Количество', :quantity
        column :total
      end
    end
  end
  sidebar "Заказ", only: [:show, :edit] do
    attributes_table_for order do
      row 'Дата заказа' do
        text_node order.created_at
      end
      row 'Сумма заказа' do
        text_node order.subtotal
      end
      row 'Заказчик' do
        text_node order.user.full_name
      end
      row 'Телефон' do
        text_node order.user.phone
      end
      row 'Email' do
        text_node order.user.email
      end
      row 'Статус' do
        text_node order.status
      end
    end
  end
end

ActiveAdmin.register OrderItem do
  belongs_to :order
  permit_params :id, :product_id, :quantity, :unit_price, :total

  # column :name
end
