# seeds.rb

# Roles
role_admin = Role.create(name: 'Admin')
role_officer = Role.create(name: 'Officer')
role_volunteer = Role.create(name: 'Volunteer')

# Members
member1 = Member.create(first_name: 'Ada', last_name: 'Lovelace', role: role_admin)
member2 = Member.create(first_name: 'Alan', last_name: 'Turing', role: role_officer)
member3 = Member.create(first_name: 'Grace', last_name: 'Hopper', role: role_volunteer)
member4 = Member.create(first_name: 'John', last_name: 'von Neumann', role: role_admin)
member5 = Member.create(first_name: 'Linus', last_name: 'Torvalds', role: role_officer)
member6 = Member.create(first_name: 'Margaret', last_name: 'Hamilton', role: role_volunteer)
member7 = Member.create(first_name: 'Tim', last_name: 'Berners-Lee', role: role_admin)
member8 = Member.create(first_name: 'Donald', last_name: 'Knuth', role: role_officer)
member9 = Member.create(first_name: 'Ada', last_name: 'Yonath', role: role_volunteer)
member10 = Member.create(first_name: 'Shafi', last_name: 'Goldwasser', role: role_admin)

# MemberShifts
MemberShift.create(title: 'Morning Shift', ideal_volunteers: 5, ideal_officers: 2, start_time: Time.now, end_time: Time.now + 4.hours)
MemberShift.create(title: 'Evening Shift', ideal_volunteers: 3, ideal_officers: 1, start_time: Time.now + 5.hours, end_time: Time.now + 9.hours)
MemberShift.create(title: 'Night Shift', ideal_volunteers: 4, ideal_officers: 1, start_time: Time.now + 10.hours, end_time: Time.now + 14.hours)
MemberShift.create(title: 'Weekend Shift', ideal_volunteers: 6, ideal_officers: 2, start_time: Time.now + 2.days, end_time: Time.now + 2.days + 8.hours)
MemberShift.create(title: 'Holiday Shift', ideal_volunteers: 8, ideal_officers: 3, start_time: Time.now + 5.days, end_time: Time.now + 5.days + 10.hours)

# Medications
Medication.create(name: 'Panadol', stock: 100, notes: 'For headaches and fever')
Medication.create(name: 'Antibiotic X', stock: 50, notes: 'General-purpose antibiotic')
Medication.create(name: 'PainAway', stock: 75, notes: 'Pain reliever for various conditions')
Medication.create(name: 'CoughSuppress', stock: 30, notes: 'Suppresses cough symptoms')
Medication.create(name: 'Antibiotic X', stock: 50)
Medication.create(name: 'PainAway', stock: 75)
Medication.create(name: 'CoughSuppress', stock: 30)
Medication.create(name: 'SleepEasy', stock: 20)
Medication.create(name: 'FocusOn', stock: 40)
Medication.create(name: 'HeartGuard', stock: 60)
Medication.create(name: 'DigestEase', stock: 80)
Medication.create(name: 'AllerRelief', stock: 25)
Medication.create(name: 'StressLess', stock: 45)

# MedicationTransactions
medication_transactions = Medication.all.map do |medication|
  member = Member.order('RANDOM()').first
  MedicationTransaction.create(medication: medication, member: member, amount: rand(1..20))
end

# Faqs
Faq.create(question: 'How do I apply for membership?', answer: 'You can apply for membership by visiting our website and completing the online application form.')
Faq.create(question: 'What events do you host?', answer: 'We host a variety of events throughout the year, including workshops, seminars, and social gatherings.')
Faq.create(question: 'Can I volunteer for multiple shifts?', answer: 'Yes, you can volunteer for multiple shifts. Please check the schedule for available slots.')
Faq.create(question: 'How often should I take Medication X?', answer: 'The recommended dosage for Medication X is twice a day, as prescribed by your healthcare provider.')
Faq.create(question: 'Is there a discount for purchasing medications in bulk?', answer: 'Yes, we offer discounts for bulk purchases. Please inquire at our pharmacy for more information.')

# Display a message
puts 'Seed data created successfully!'
