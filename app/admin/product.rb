ActiveAdmin.register Product do
  permit_params :name, :description, :price, :weight, :expiration_days, :composition, :user_id

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :weight
    column :expiration_days
    column :composition
    column :created_at
    column :updated_at
    actions
  end

  filter :name
  filter :price
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :weight
      f.input :expiration_days
      f.input :composition
      f.input :user_id
    end

    f.actions
  end

end
