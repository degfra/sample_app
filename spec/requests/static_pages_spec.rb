require 'spec_helper'

describe "Static pages" do

	subject { page }
	
	shared_examples_for "all static pages" do
		it { should have_selector('h1', 	 text: heading) }    
    it { should have_selector('title', text: full_title(page_title)) }
	end
	
	it "should have the right links on the layout" do
		visit root_path
		click_link "About"
		page.should have_selector 'title', text: full_title('About')
		click_link "Help"
		page.should have_selector 'title', text: full_title('Help')
		click_link "Contact"
		page.should have_selector 'title', text: full_title('Contact')
		click_link "Home"
		page.should_not have_selector 'title', text: full_title('Home')
		click_link "Sign up now!"
		page.should have_selector 'title', text: full_title('Sign up')  
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' }
  end
  
  describe "Help page" do
    before { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Help' }
  end
  
  describe "About page" do
    before { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| About Us' }
  end
  
  describe "Contact page" do
    before { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Contact' }
  end 
  
end
