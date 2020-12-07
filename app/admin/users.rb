ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :username, :fullname, :occupation, :age, :school
  #
  # or
  #
  # permit_params do
  #   permitted = [:username, :fullname, :occupation, :age, :school]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do
    selectable_column
    id_column
    column :username
    column :fullname
    column :occupation
    column :school
    actions
  end

  form do |f|
    f.inputs do
      f.input :username
      f.input :fullname
      f.input :occupation
      f.input :school
    end
    f.actions
  end



end
