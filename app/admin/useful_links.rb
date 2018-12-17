ActiveAdmin.register UsefulLink do
  menu label: "Полезные ссылки"
  permit_params :image, :title, :link, :position
  config.sort_order = 'position_asc'
  config.paginate   = false
  reorderable

  index as: :reorderable_table do
    column :id
    column "Изображение", :image do |ph|
      image_tag ph.image.variant(resize: "100x100")
    end
    column "Заголовок", :title
    column "Ссылка", :link
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
      row :link
      row :position
    end
  end

  form do |f|
    f.inputs do
      f.input :title, label: "Заголовок"
      f.input :link, label: "Ccылка"
      f.input :image, as: :file, label: "Изображение"
    end
    f.actions
  end
end