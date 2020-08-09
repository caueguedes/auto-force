names = ['Ozzy Osbourne', 'Angus Young', 'Steven Tyler', 'Dave Grohl', 'Kurt Cobain']

address = ['Av. Amintas Barros Nº 3700 - Torre Business, Sala 702 - Lagoa Nova CEP: 59075-250',
           'Av. Saudade Nº 171, Sala 702 - Lagoa Nova CEP: 17075-250',
           'Rua São Carlos Nº 300 - São Carlos CEP: 15000-250',
           'Rua Carlos Drummond Nº 171 - São Paulo CEP: 17000-000 ',
           'Rua São Luis Nº 13000 - São Paulo CEP: 17000-700 ']

5.times do |i|
  Order.create(reference: "BR10288#{i}", purchase_channel: "Site BR", client_name: names[i], address: address[i], delivery_service: "SEDEX", total_value: "12#{i}.20", line_items: "[{sku: case-my-best-friend, model: iPhone X, case type: Rose Leather}, {sku: powebank-sunshine, capacity: 10000mah}, {sku: earphone-standard, color: white}]", status: 0)
  Order.create(reference: "BR1029#{i}8", purchase_channel: "Site USD", client_name: names[i], address: address[i], delivery_service: "FEDEX", total_value: "1#{i}2.20", line_items: "[{sku: case-my-best-friend, model: iPhone 5, case type: Red Leather}, {sku: powebank-sunshine, capacity: 10000mah}]", status: 0)
  Order.create(reference: "BR102#{i}99", purchase_channel: "Web BR", client_name: names[i], address: address[i], delivery_service: "CARRIER", total_value: "#{i}12.20", line_items: "[{sku: case-my-best-friend, model: iPhone 4, case type: Blue Leather}, {sku: earphone-standard, color: white}]", status: 0)
end
