def print_bills(bills)
    bills.each do |bill|
        puts "-= Bill #{bill.id} =-"
        puts "Valor: #{bill.valor}"
        puts "Vencimento: #{bill.data_vencimento}\n\n"
    end
    true
end