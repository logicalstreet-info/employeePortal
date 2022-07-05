# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Organization
org = Organization.create!(name: "organation1")
orgs = Organization.create!(name: "organation2")
orgz = Organization.create!(name: "admin_organation")

#Organizations super-admin
user = User.create!(email: "superadmin@gmail.com", password: "123456", name: "superadmin", organization_id: orgz.id)
user.add_role :superadmin
user.remove_role :newuser
user.save!

#Organization's admins
admin = User.create!(email: "admin@gmail.com", password: "123456", name: "admin", organization_id: org.id)
admin.add_role :admin
admin.remove_role :newuser
admin.save!
admin2 = User.create!(email: "admin1@gmail.com", password: "123456", name:"admin1", organization_id: orgs.id)
admin2.add_role :admin
admin2.remove_role :newuser
admin2.save!

#Organization's Users
user1 = User.create!(email: "user1@gmail.com", password: "123456", name: "user1", organization_id: org.id)
user2 = User.create!(email: "user2@gmail.com", password: "123456", name: "user2", organization_id: org.id)
user3 = User.create!(email: "user3@gmail.com", password: "123456", name:"user3", organization_id: org.id)
user4 = User.create!(email: "user4@gmail.com", password: "123456", name:"user4", organization_id: org.id)
user5 = User.create!(email: "user5@gmail.com", password: "123456", name:"user5", organization_id: org.id)
user6 = User.create!(email: "user6@gmail.com", password: "123456", name:"user6", organization_id: orgs.id)
user7 = User.create!(email: "user7@gmail.com", password: "123456", name:"user7", organization_id: orgs.id)
user8 = User.create!(email: "user8@gmail.com", password: "123456", name:"user8", organization_id: orgs.id)
user9 = User.create!(email: "user9@gmail.com", password: "123456", name:"user9", organization_id: orgs.id)
user10 = User.create!(email: "user10@gmail.com", password: "123456", name:"user10", organization_id: orgs.id)

#Organization's Property's
Property.create!(assets_type:"Laptop", name: "Propertys1", description: "Propertys description 1", purchase_date: Date.today, warranty_month: 2, user_id: user1.id, organization_id: org.id)
Property.create!(assets_type:"LED", name: "Propertys2", description: "Propertys description 2", purchase_date: Date.today, warranty_month: 2, user_id: user2.id, organization_id: org.id)
Property.create!(assets_type:"Mouse", name: "Propertys3", description: "Propertys description 3", purchase_date: Date.today, warranty_month: 2, user_id: user3.id, organization_id: org.id)
Property.create!(assets_type:"CPU", name: "Propertys4", description: "Propertys description 3", purchase_date: Date.today, warranty_month: 2, user_id: user4.id, organization_id: org.id)
Property.create!(assets_type:"cable", name: "Propertys5", description: "Propertys description 5", purchase_date: Date.today, warranty_month: 2, user_id: user5.id, organization_id: org.id)
Property.create!(assets_type:"Laptop", name: "Propertys6", description: "Propertys description 1", purchase_date: Date.today, warranty_month: 2, user_id: user6.id, organization_id: orgs.id)
Property.create!(assets_type:"LED", name: "Propertys7", description: "Propertys description 2", purchase_date: Date.today, warranty_month: 2, user_id: user7.id, organization_id: orgs.id)
Property.create!(assets_type:"Mouse", name: "Propertys8", description: "Propertys description 3", purchase_date: Date.today, warranty_month: 2, user_id: user8.id, organization_id: orgs.id)
Property.create!(assets_type:"CPU", name: "Propertys9", description: "Propertys description 4", purchase_date: Date.today, warranty_month: 2, user_id: user9.id, organization_id: orgs.id)
Property.create!(assets_type:"cable", name: "Propertys10", description: "Propertys description 5", purchase_date: Date.today, warranty_month: 2, user_id: user10.id, organization_id: orgs.id)

#Orgnization's Leave Days
LeaveDay.create!(name:'Diwali', holiday: Date.today + 1.month, organization_id: org.id)
LeaveDay.create!(name:'Christmas', holiday: Date.today + 1.month, organization_id: org.id)
LeaveDay.create!(name:'Uttrayan', holiday: Date.today + 1.month, organization_id: org.id)
LeaveDay.create!(name:'Diwali', holiday: Date.today + 1.month, organization_id: orgs.id)
LeaveDay.create!(name:'Christmas', holiday: Date.today + 1.month, organization_id: orgs.id)
LeaveDay.create!(name:'Uttrayan', holiday: Date.today + 1.month, organization_id: orgs.id)

#Organization's Project's
#For user1
project1 = Project.create!(name: "project1", organization_id: org.id, project_end_date: Date.today + 1.month)
project1.user_ids = user1.id
project1.save
#user2
project2 = Project.create!(name: "project2", organization_id: org.id, project_end_date: Date.today + 1.month)
project2.user_ids = user2.id
project2.save
#user3
project3 = Project.create!(name: "project3", organization_id: org.id, project_end_date: Date.today + 1.month)
project3.user_ids = user3.id
project3.save
#user4
project4 = Project.create!(name: "project4",organization_id: org.id, project_end_date: Date.today + 1.month)
project4.user_ids = user4.id
project4.save
#user5
project5 = Project.create!(name: "project5",organization_id: org.id, project_end_date: Date.today + 1.month)
project5.user_ids = user5.id
project5.save
#user6
project6 = Project.create!(name: "project6",organization_id: orgs.id, project_end_date: Date.today + 1.month)
project6.user_ids = user6.id
project6.save
#user7
project7 = Project.create!(name: "project7",organization_id: orgs.id, project_end_date: Date.today + 1.month)
project7.user_ids = user7.id
project7.save
#user8
project8 = Project.create!(name: "project8",organization_id: orgs.id, project_end_date: Date.today + 1.month)
project8.user_ids = user8.id
project8.save
#user9
project9 = Project.create!(name: "project9",organization_id: orgs.id, project_end_date: Date.today + 1.month)
project9.user_ids = user10.id
project9.save
#user10
project10 = Project.create!(name: "project10",organization_id: orgs.id, project_end_date: Date.today + 1.month)
project10.user_ids = user10.id
project10.save

#User-side DailyUpdates
Update.create!(description: "Daily Update Description1", in_time: Time.now, out_time: Time.now + 4.hour, user_id: user1.id, organization_id: org.id, project_id: project1.id)
Update.create!(description: "Daily Update Description2", in_time: Time.now, out_time: Time.now + 4.hour, user_id: user2.id, organization_id: org.id, project_id: project2.id)
Update.create!(description: "Daily Update Description3", in_time: Time.now, out_time: Time.now + 4.hour, user_id: user3.id, organization_id: org.id, project_id: project3.id)
Update.create!(description: "Daily Update Description4", in_time: Time.now, out_time: Time.now + 4.hour, user_id: user4.id, organization_id: org.id, project_id: project4.id)
Update.create!(description: "Daily Update Description5", in_time: Time.now, out_time: Time.now + 4.hour, user_id: user5.id, organization_id: org.id, project_id: project5.id)
Update.create!(description: "Daily Update Description6", in_time: Time.now, out_time: Time.now + 4.hour, user_id: user6.id, organization_id: orgs.id, project_id: project6.id)
Update.create!(description: "Daily Update Description7", in_time: Time.now, out_time: Time.now + 4.hour, user_id: user7.id, organization_id: orgs.id, project_id: project7.id)
Update.create!(description: "Daily Update Description8", in_time: Time.now, out_time: Time.now + 4.hour, user_id: user8.id, organization_id: orgs.id, project_id: project8.id)
Update.create!(description: "Daily Update Description9", in_time: Time.now, out_time: Time.now + 4.hour, user_id: user9.id, organization_id: orgs.id, project_id: project9.id)
Update.create!(description: "Daily Update Description10", in_time: Time.now, out_time: Time.now + 4.hour, user_id: user10.id, organization_id: orgs.id, project_id: project10.id)

#User-side Leave's
LeaveApplication.create!(leave_type: "Personal", description: "Leave description 1", from_date: Date.today, to_date: Date.today + 2, user_id: user1.id, organization_id: org.id)
LeaveApplication.create!(leave_type: "Medical", description: "Leave description 2", from_date: Date.today, to_date: Date.today + 2, user_id: user2.id, organization_id: org.id)
LeaveApplication.create!(leave_type: "Family_Emergency", description: "Leave description 3", from_date: Date.today, to_date: Date.today + 2, user_id: user3.id, organization_id: org.id)
LeaveApplication.create!(leave_type: "Other", description: "Leave description 4", from_date: Date.today, to_date: Date.today + 2, user_id: user4.id, organization_id: org.id)
LeaveApplication.create!(leave_type: "Religious", description: "Leave description 5", from_date: Date.today, to_date: Date.today + 2, user_id: user5.id, organization_id: org.id)
LeaveApplication.create!(leave_type: "Personal", description: "Leave description 1", from_date: Date.today, to_date: Date.today + 2, user_id: user6.id, organization_id: orgs.id)
LeaveApplication.create!(leave_type: "Medical", description: "Leave description 2", from_date: Date.today, to_date: Date.today + 2, user_id: user7.id, organization_id: orgs.id)
LeaveApplication.create!(leave_type: "Family_Emergency", description: "Leave description 3", from_date: Date.today, to_date: Date.today + 2, user_id: user8.id, organization_id: orgs.id)
LeaveApplication.create!(leave_type: "Other", description: "Leave description 4", from_date: Date.today, to_date: Date.today + 2, user_id: user9.id, organization_id: orgs.id)
LeaveApplication.create!(leave_type: "Religious", description: "Leave description 5", from_date: Date.today, to_date: Date.today + 2, user_id: user10.id, organization_id: orgs.id)