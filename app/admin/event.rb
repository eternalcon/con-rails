ActiveAdmin.register Event do
  actions :index, :show, :new, :create, :update, :edit

  permit_params :name, :subtitle, :startdate, :enddate, :active

  index do
    id_column
    column :name
    column :subtitle
    column :startdate
    column :enddate
    column(:participants) {|u|
      link_to("Participants #{u.participants.size}", admin_event_participants_path(u), class: 'member_link view_link')
    }
    column(:prices) {|u|
      link_to("Prices", admin_event_prices_path(u), class: 'member_link view_link')
    }
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs 'Event' do
      f.input :name
      f.input :subtitle
      f.input :startdate
      f.input :enddate
      f.input :active
    end
    f.actions
  end
end

