require 'spec_helper'
describe "ReservationsPages" do
	describe "CREATE action" do
		let(:reserv_hash) { {reservation:{date:'25-9-2012',num_of_people: 3,museum: 'http://localhost:3000/museums/MUSEO_DELL\'OPERA_DEL_DUOMO.xml'  } }}
		let!(:user) {User.create(name: 'luco',email:'a@b.c',password:'d',password_confirmation:'d')}
	

#		describe "with regular input" do
#			it "should increment the reservations number" do
#				expect {basic_auth user.email, user.password ; post 	reservations_path, reserv_hash}.to change(Reservation,:count).by(1)
#			end
#		end

#		describe "with non regular input" do
#			before {reserv_hash[:reservation][:date]=''}
#			it "should not increment the reservation number" do
#				expect {basic_auth user.email, user.password ; post reservations_path, reserv_hash}.not_to change(Reservation,:count).by(1)
#			end
#		end
		
#		describe "without credentials" do
#			it "should not increment the reservation number" do
#				expect {post "#{reservations_path}", reserv_hash}.not_to change(Reservation,:count).by(1)
#			end
#		end
	end
end
