require 'spec_helper'

describe "MuseumsControllers" do
	subject { page }

	describe "list museums in xml format" do
		before { visit "#{museums_path}.xml" }
		it "should be a valid xml file" do
			page.should have_selector 'museums'
		end
		describe "invalid page parameter" do
			before {  visit "#{museums_path}.xml?page=4535422" }
			it "should be a valid xml file" do
				page.should have_selector 'museums'
			end
		end
	end

	describe "museum xml information" do
		describe "correct request output" do
			before { visit "#{museums_path}/VILLA_MEDICEA_DI_CAREGGI.xml" }
			it "should be a valid xml file" do
				page.should have_selector 'museum'
				page.should have_selector 'name'
			end
		end
		describe "incorrect request" do
			before { get "#{museums_path}/MUSEOadfadfadfadfadfad.xml" } 
			it "should have a 404 response code" do
				response.response_code.should == 404
			end
		end
	end
end
