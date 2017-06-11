ActiveAdmin.register Freeform do
  actions :index, :show, :new, :create, :update, :edit

  permit_params :event_id, :title, :desc_short, :desc_long

  index do
    id_column
    column :event_id
    column :title
    column :desc_short
    column :desc_long
  end
end

