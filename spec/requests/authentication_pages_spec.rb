require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Авторизация') }
    it { should have_title('Авторизация') }
  end
  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_title('Авторизация') }
      it { should have_selector('div.alert.alert-error') }

      describe "after visiting another page" do
        before { click_link "Главная" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      describe "followed by signout" do
        before { click_link "Выход" }
        it { should have_link('Авторизоваться') }
      end

      it { should have_title(user.name) }
      it { should have_link('Профиль',            href: user_path(user)) }
      it { should have_link('Выход',              href: signout_path) }
      it { should_not have_link('Авторизоваться', href: signin_path) }
    end
  end
end
