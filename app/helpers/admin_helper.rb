module AdminHelper
  def customer_initials(name)
    name.to_s.split.map(&:first).join.upcase[0..1]
  end

  def status_badge_class(status)
    {
      "pending" => "bg-amber-100 text-amber-700",
      "confirmed" => "bg-emerald-100 text-emerald-700",
      "completed" => "bg-gray-100 text-gray-600",
      "cancelled" => "bg-red-100 text-red-700"
    }[status] || "bg-gray-100 text-gray-600"
  end

  def status_label(status)
    { "pending" => "Menunggu", "confirmed" => "Dikonfirmasi", "completed" => "Selesai", "cancelled" => "Dibatalkan" }[status] || status
  end

  def favorite_service_for(customer)
    service_counts = customer.bookings.group(:service_id).count
    return "-" if service_counts.empty?
    top_service_id = service_counts.max_by { |_, count| count }.first
    Service.find_by(id: top_service_id)&.name || "-"
  end

  def customer_total_spent(customer)
    customer.bookings.where(status: "completed").sum { |b| b.service.price }
  end
end