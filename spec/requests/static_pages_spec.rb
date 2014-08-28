require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Путь Воина::Перезагрузка') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Главная') }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('Помощь') }
    it { should have_title(full_title('Помощь')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('О нас') }
    it { should have_title(full_title('О нас')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Контакты') }
    it { should have_title(full_title('Контакты')) }
  end
end