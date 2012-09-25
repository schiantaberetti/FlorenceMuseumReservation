namespace :db do
	desc "Fill the db with some data"
	task populate: :environment do
		User.create(name: 'luco',email: 'baldo@lilik.it',password: 'test',password_confirmation: 'test')
		User.create(name: 'roma',email: 'roma@lilik.it',password: 'test',password_confirmation: 'test')

		User.find(1).reservations.create(museum: 'strozzi',date:'25/9/2012',num_of_people:2)
		User.find(1).reservations.create(museum: 'uffizi',date:'26/9/2012',num_of_people:2)
		User.find(2).reservations.create(museum: 'boboli',date:'26/9/2012',num_of_people:1)
	end
	
end
