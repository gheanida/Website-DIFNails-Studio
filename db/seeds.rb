# Clear existing data to ensure idempotency
Transaction.delete_all
Booking.delete_all
Customer.delete_all
Service.delete_all
ServiceCategory.delete_all
AdminUser.delete_all


OperatingHour::DAYS.each_with_index do |day, index|
  OperatingHour.find_or_create_by!(day_of_week: index) do |oh|
    oh.is_open = index != 6
    oh.open_time = "09:00"
    oh.close_time = "20:00"
  end
end

# 1. Seed Admin Users
AdminUser.create!(
  email: "admin@difnails.com",
  password: "password123",
  password_confirmation: "password123"
)
puts "Seeded Admin: admin@difnails.com / password123"

# 2. Seed Service Categories
nail_art = ServiceCategory.create!(name: "Nail Art")
manicure = ServiceCategory.create!(name: "Manicure")
pedicure = ServiceCategory.create!(name: "Pedicure")
extensions = ServiceCategory.create!(name: "Gel Extension")
puts "Seeded #{ServiceCategory.count} service categories."

# 3. Seed Services
services_data = [
  {
    name: "Midnight Velvet Gel",
    description: "Intense obsidian base with a premium velvet magnetic finish and soft dark sparkles.",
    price: 120000,
    is_active: true,
    service_category: nail_art,
    image_url: "https://images.unsplash.com/photo-1604654894610-df63bc536371?q=80&w=600&auto=format&fit=crop"
  },
  {
    name: "Classic Pearl Manicure",
    description: "Nourishing hand care treatment featuring classic shaping, cuticle care, and pearl shell polish.",
    price: 90000,
    is_active: true,
    service_category: manicure,
    image_url: "https://images.unsplash.com/photo-1632345031435-8797b2d58045?q=80&w=600&auto=format&fit=crop"
  },
  {
    name: "Serene Petal Spa Pedicure",
    description: "Relaxing warm foot soak, organic floral scrub, massage, and custom floral nail polish.",
    price: 150000,
    is_active: true,
    service_category: pedicure,
    image_url: "https://images.unsplash.com/photo-1519014816548-bf5fe059798b?q=80&w=600&auto=format&fit=crop"
  },
  {
    name: "Acrylic Gel Extensions",
    description: "Full set of sculpted gel extensions with custom length, shape, and glassmorphic overlays.",
    price: 250000,
    is_active: true,
    service_category: extensions,
    image_url: "https://images.unsplash.com/photo-1607779097040-26e80aa78e66?q=80&w=600&auto=format&fit=crop"
  },
  {
    name: "Glitter French Tips",
    description: "Elegant French tips dusted with fine silver-blue glitter flakes and high-gloss sealing.",
    price: 110000,
    is_active: true,
    service_category: nail_art,
    image_url: "https://images.unsplash.com/photo-1522337360788-8b13dee7a37e?q=80&w=600&auto=format&fit=crop"
  },
  {
    name: "Matte Charcoal Set",
    description: "Sleek matte charcoal nails accented with thin metallic chrome lining and minimalist geometry.",
    price: 130000,
    is_active: true,
    service_category: nail_art,
    image_url: "https://images.unsplash.com/photo-1604654894910-ee8725357a08?q=80&w=600&auto=format&fit=crop"
  }
]

services = services_data.map { |data| Service.create!(data) }
puts "Seeded #{Service.count} services."

# 4. Seed Customers
jane = Customer.create!(
  name: "Jane Doe",
  email: "customer@example.com",
  password: "password123",
  password_confirmation: "password123",
  phone: "+628123456789",
  status: "Active"
)

alice = Customer.create!(
  name: "Alice Smith",
  email: "alice@example.com",
  password: "password123",
  password_confirmation: "password123",
  phone: "+628771234567",
  status: "Active"
)

bob = Customer.create!(
  name: "Bob Jones",
  email: "bob@example.com",
  password: "password123",
  password_confirmation: "password123",
  phone: "+628198765432",
  status: "Active"
)

clara = Customer.create!(
  name: "Clara Oswald",
  email: "clara@example.com",
  password: "password123",
  password_confirmation: "password123",
  phone: "+628213344556",
  status: "Inactive"
)

diana = Customer.create!(
  name: "Diana Prince",
  email: "diana@example.com",
  password: "password123",
  password_confirmation: "password123",
  phone: "+628999888777",
  status: "Active"
)
puts "Seeded #{Customer.count} customers."

# 5. Seed Bookings & Linked Transactions
# Booking 1: Bob Jones (Yesterday, Completed)
booking_bob = Booking.create!(
  booking_date: Date.yesterday,
  booking_time: "11:00",
  customer: bob,
  service: services.second, # Classic Pearl Manicure
  status: "completed",
  notes: "Prefers gentle cuticle clean."
)
Transaction.create!(
  booking: booking_bob,
  amount: services.second.price,
  category: "income",
  transaction_type: "payment",
  transaction_date: Date.yesterday,
  description: "Payment for Classic Pearl Manicure - Bob Jones"
)

# Booking 2: Diana Prince (2 days ago, Completed)
booking_diana = Booking.create!(
  booking_date: Date.today - 2.days,
  booking_time: "16:00",
  customer: diana,
  service: services.first, # Midnight Velvet Gel
  status: "completed",
  notes: "Wants very sharp coffin shape."
)
Transaction.create!(
  booking: booking_diana,
  amount: services.first.price,
  category: "income",
  transaction_type: "payment",
  transaction_date: Date.today - 2.days,
  description: "Payment for Midnight Velvet Gel - Diana Prince"
)

# Booking 3: Jane Doe (Today, Confirmed)
Booking.create!(
  booking_date: Date.today,
  booking_time: "10:00",
  customer: jane,
  service: services.first, # Midnight Velvet Gel
  status: "confirmed",
  notes: "Prefers silent appointment. Needs matte topcoat test."
)

# Booking 4: Alice Smith (Today, Pending/In Queue)
Booking.create!(
  booking_date: Date.today,
  booking_time: "14:00",
  customer: alice,
  service: services.fourth, # Acrylic Gel Extensions
  status: "pending",
  notes: "Wants custom rhinestone nail art accents."
)

# Booking 5: Clara Oswald (Tomorrow, Confirmed)
Booking.create!(
  booking_date: Date.tomorrow,
  booking_time: "09:30",
  customer: clara,
  service: services.third, # Serene Petal Spa Pedicure
  status: "confirmed",
  notes: "Extra massage time requested."
)

puts "Seeded #{Booking.count} bookings and #{Transaction.count} transactions."
