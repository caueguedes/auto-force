client_list = [
    ['Ozzy Osbourne', 'Av. Amintas Barros Nº 3700 - Torre Business, Sala 702 - Lagoa Nova CEP: 59075-250'],
    ['Angus Young', 'Av. Saudade Nº 171, Sala 702 - Lagoa Nova CEP: 17075-250'],
    ['Steven Tyler', 'Rua São Carlos Nº 300 - São Carlos CEP: 15000-250'],
    ['Dave Grohl', 'Rua Carlos Drummond Nº 171 - São Paulo CEP: 17000-000'],
    ['Kurt Cobain', 'Rua São Luis Nº 13000 - São Paulo CEP: 17000-700']
]

client_list.each_with_index do |name, address, index|
  Order.create(reference: "BR10288#{index}", purchase_channel: "Site BR", client_name: name, address: address, delivery_service: "SEDEX", total_value: "12#{index}.20".to_d, line_items: "[{sku: case-my-best-friend, model: iPhone X, case type: Rose Leather}, {sku: powebank-sunshine, capacity: 10000mah}, {sku: earphone-standard, color: white}]", status: 0)
  Order.create(reference: "BR1029#{index}8", purchase_channel: "Site USD", client_name: name, address: address, delivery_service: "FEDEX", total_value: "1#{index}2.20".to_d, line_items: "[{sku: case-my-best-friend, model: iPhone 5, case type: Red Leather}, {sku: powebank-sunshine, capacity: 10000mah}]", status: 0)
  Order.create(reference: "BR102#{index}99", purchase_channel: "Web BR", client_name: name, address: address[i], delivery_service: "CARRIER", total_value: "#{index}12.20".to_d, line_items: "[{sku: case-my-best-friend, model: iPhone 4, case type: Blue Leather}, {sku: earphone-standard, color: white}]", status: 0)
end