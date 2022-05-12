ActiveAdmin.register User do
  permit_params :email, :phone, :first_name, :middle_name, :last_name, :role

  index do
    selectable_column
    id_column
    column :email
    column :phone
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :phone
      f.input :first_name
      f.input :middle_name
      f.input :last_name
      f.input :role
    end
    f.actions
  end

end
