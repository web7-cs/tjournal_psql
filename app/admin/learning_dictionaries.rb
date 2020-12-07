ActiveAdmin.register LearningDictionary do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :definition, :content
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :definition, :content]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :title
    column :definition
    column :content
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :definition
      f.input :content
    end
    f.actions
  end
  
end
