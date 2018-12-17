ActiveAdmin.register Photo do
  menu label: "Фото"
  permit_params :image, :title, :main, :circle, :position
  config.sort_order = 'position_asc'
  config.paginate   = false
  reorderable

  index as: :reorderable_table do
    column :id
    column "Изображение", :image do |ph|
      image_tag ph.image.variant(resize: "100x100")
    end
    column "Заголовок", :title
    column "Главное фото", :main
    column "Фото в круге", :circle
    column "Позиция", :position
    actions
  end
  
  show do
    attributes_table do
      row :id
      row "Изображение" do |ph|
        image_tag ph.image.variant(resize: "100x100")
      end
      row :title
      row :main
      row :circle
      row :position
    end
  end

  form do |f|
    f.inputs do
      f.input :title, label: "Заголовок"
      f.input :main, label: "Главное фото"
      f.input :circle, label: "Фото в круге"
      f.input :image, as: :file, label: "Изображение"
    end
    f.actions
  end
end