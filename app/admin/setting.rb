# frozen_string_literal: true

ActiveAdmin.register_page 'Setting' do
  title = 'Настройки'
  menu label: title
  active_admin_settings_page(title: title)
end
