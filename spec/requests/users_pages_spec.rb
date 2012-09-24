require 'spec_helper'

describe "UsersPages" do
	describe "creation of a new user" do
		describe "regular creation" do
			it "should create valid user" do
				expect {post "#{users_path}", {user: {name:'luco',email:'cacca@culo.it',password:'test',password_confirmation:'test'}}}.to	change(User,:count).by(1)
			end
			it "should return the code 201" do
				post "#{users_path}", {user: {name:'luco',email:'cacca@culo.it',password:'test',password_confirmation:'test'}}
				response.response_code.should == 201
			end
		end
		describe "non regular creation" do
			before {post "#{users_path}", {user: {name:'luco',email:'cacca@culo.it',password:'tefsdst',password_confirmation:'test'}}}
			it "should have a 406 response code" do
				response.response_code.should == 406
			end
			it "should not create valid user" do
				expect {post "#{users_path}", {user: {name:'luco',email:'',password:'test',password_confirmation:'test'}}}.not_to change(User, :count).by(1)
			end
		end

	end
end
