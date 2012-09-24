require 'spec_helper'

describe User do
	let(:user) {User.new(name: 'luco',email: 'luco@gmail.com',password: 'testtest',password_confirmation: 'testtest')}
	subject {user}

	it { should be_valid}
	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:authenticate) }

	describe "invalid user" do
		before {user.name=''}
		it { should_not be_valid  }
	end
end
