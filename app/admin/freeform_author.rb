ActiveAdmin.register FreeformAuthor do
  actions :index, :show, :new, :create, :update, :edit

  permit_params :freeform_id, :name, :email

  index do
    id_column
    column :freeform_id
    column :name
    column :email

    actions
  end
end


