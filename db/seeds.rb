# frozen_string_literal: true

# Empty all tables
ActiveRecord::Base.connection.tables.each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table} RESTART IDENTITY CASCADE;")
end

# Members
Member.create!(email: 'thisisanemail@gmail.com', password: 'password', role: 'admin')
Member.create!(email: 'chungus@gmail.com', password: 'password123', role: 'volunteer')

# Events
Event.create!(title: 'Morning Shift', ideal_volunteers: 5, ideal_underclassmen: 0, ideal_upperclassmen: 0, start_time: Time.zone.now, end_time: Time.zone.now + 4.hours)
Event.create!(title: 'Evening Shift', ideal_volunteers: 3, ideal_underclassmen: 0, ideal_upperclassmen: 0, start_time: Time.zone.now + 5.hours,
              end_time: Time.zone.now + 9.hours
)
Event.create!(title: 'Night Shift', ideal_volunteers: 4, ideal_underclassmen: 0, ideal_upperclassmen: 0, start_time: Time.zone.now + 10.hours,
              end_time: Time.zone.now + 14.hours
)
Event.create!(title: 'Weekend Shift', ideal_volunteers: 6, ideal_underclassmen: 0, ideal_upperclassmen: 0, start_time: Time.zone.now + 2.days,
              end_time: Time.zone.now + 2.days + 8.hours
)
Event.create!(title: 'Holiday Shift', ideal_volunteers: 8, ideal_underclassmen: 0, ideal_upperclassmen: 0, start_time: Time.zone.now + 5.days,
              end_time: Time.zone.now + 5.days + 10.hours
)

# Calendar Events
CalendarEvent.create!(title: 'Workshop on Stress Management', description: 'Learn how to manage stress effectively',
                      start_datetime: Time.zone.now + 1.day, end_datetime: Time.zone.now + 1.day + 2.hours
)
CalendarEvent.create!(title: 'Seminar on Healthy Eating', description: 'Discover the benefits of a healthy diet',
                      start_datetime: Time.zone.now + 1.day, end_datetime: Time.zone.now + 1.day + 3.hours
)
CalendarEvent.create!(title: 'Social Gathering', description: 'Join us for a fun evening of games and music', start_datetime: Time.zone.now + 3.days,
                      end_datetime: Time.zone.now + 3.days + 4.hours
)
CalendarEvent.create!(title: 'Volunteer Orientation', description: 'Learn about our organization and how you can help',
                      start_datetime: Time.zone.now + 4.days, end_datetime: Time.zone.now + 4.days + 1.hour
)
CalendarEvent.create!(title: 'Health Fair', description: 'Get free health screenings and learn about healthy living',
                      start_datetime: Time.zone.now + 5.days, end_datetime: Time.zone.now + 5.days + 5.hours
)

# Resources
Resource.create!(title: 'Volunteer Handbook', description: 'Guidelines for volunteers', url: 'https://www.example.com/volunteer-handbook')
Resource.create!(title: 'Officer Handbook', description: 'Guidelines for officers', url: 'https://www.example.com/officer-handbook')
Resource.create!(title: 'Medication Guide', description: 'Information on common medications', url: 'https://www.example.com/medication-guide')
Resource.create!(title: 'Health and Safety Manual', description: 'Guidelines for maintaining a safe environment', url: 'https://www.example.com/health-and-safety-manual')
Resource.create!(title: 'Event Planning Guide', description: 'Tips for planning successful events', url: 'https://www.example.com/event-planning-guide')

# Medications
Medication.create!(name: 'Panadol', stock: 100, notes: 'For headaches and fever')
Medication.create!(name: 'Antibiotic X', stock: 50, notes: 'General-purpose antibiotic')
Medication.create!(name: 'PainAway', stock: 75, notes: 'Pain reliever for various conditions')
Medication.create!(name: 'CoughSuppress', stock: 30, notes: 'Suppresses cough symptoms')
Medication.create!(name: 'Antibiotic X', stock: 50)
Medication.create!(name: 'PainAway', stock: 75)
Medication.create!(name: 'CoughSuppress', stock: 30)
Medication.create!(name: 'SleepEasy', stock: 20)
Medication.create!(name: 'FocusOn', stock: 40)
Medication.create!(name: 'HeartGuard', stock: 60)
Medication.create!(name: 'DigestEase', stock: 80)
Medication.create!(name: 'AllerRelief', stock: 25)
Medication.create!(name: 'StressLess', stock: 45)

# MedicationTransactions
Medication.all.map do |medication|
  member = Member.order('RANDOM()').first
  MedicationTransaction.create!(medication: medication, member: member, amount: rand(1..20))
end

# Faqs
Faq.create!(question: 'How do I apply for membership?',
            answer: 'You can apply for membership by visiting our website and completing the online application form.'
           )
Faq.create!(question: 'What events do you host?',
            answer: 'We host a variety of events throughout the year, including workshops, seminars, and social gatherings.'
           )
Faq.create!(question: 'Can I volunteer for multiple shifts?',
            answer: 'Yes, you can volunteer for multiple shifts. Please check the schedule for available slots.'
           )
Faq.create!(question: 'How often should I take Medication X?',
            answer: 'The recommended dosage for Medication X is twice a day, as prescribed by your healthcare provider.'
           )
Faq.create!(question: 'Is there a discount for purchasing medications in bulk?',
            answer: 'Yes, we offer discounts for bulk purchases. Please inquire at our pharmacy for more information.'
           )

# Display a message
Rails.logger.debug('Seed data created successfully!')
