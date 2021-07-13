# README

This is the finance tracker app from the Complete Ruby on Rails Developer course

 <tr>
                    <th scope="row"><%= serial_number %></th>
                    <% serial_number += 1 %>
                    <td><%= stock.symbol %></td>
                    <td><%= stock.previous_close %></td>
                    <td><%= button_to("Delete", user_stock_path(stock), method: :delete, class: "btn btn-sm btn-warning")%></td>
                    </tr>