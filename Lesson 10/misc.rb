=begin
# frozen_string_literal: true

def main_menu
  puts 'Type 1, to create station,train,route or add/remove wagons to train.'
  puts 'Type 2, to use created stations, routes, wagons.'
  puts 'Type 3, to look at created stations, routes, wagons.'
  puts 'Type 4, to test program.'
  puts 'Type 0, to exit the program.'
  case input
  when '1'
    create_menu
  when '2'
    created_menu
  when '3'
    watch_menu
  when '4'
    seed
  when '0'
    puts 'Good bye!'
    exit(0)
  else
    puts 'Wrong input! Try again!'
    main_menu
  end
end

def create_menu
  puts 'Type 1, to create a station.'
  puts 'Type 2, to create a train.'
  puts 'Type 3, to create a route for train.'
  puts 'Type 4, to create a wagon.'
  puts 'Type 5, to go to the main menu.'
  puts 'Type 0, to exit the program.'
  case input
  when '1'
    create_station_menu
  when '2'
    create_train_menu
  when '3'
    create_route_menu
  when '4'
    create_wagon_menu
  when '5'
    main_menu
  when '0'
    puts 'Good bye!'
    exit(0)
  else
    puts 'Wrong input! Try again!'
    create_menu
  end
end

def created_menu
  puts 'What do you want to use?'
  puts 'Type 1, to use created routes.'
  puts 'Type 2, to use created trains.'
  puts 'Type 3, to use created wagons.'
  puts 'Type 4, to go to the main menu.'
  puts 'Type 0, to exit the program.'
  case input
  when '1'
    use_created_routes_menu
  when '2'
    use_created_trains_menu
  when '3'
    use_created_wagons_menu
  when '4'
    main_menu
  when '0'
    puts 'Good bye!'
    exit(0)
  else
    puts 'Wrong input! Try again!'
    created_menu
  end
end

def watch_menu
  puts 'Type 1, to look at created stations.'
  puts 'Type 2, to look at created trains.'
  puts 'Type 3, to look at created routes.'
  puts 'Type 4, to look at trains on current station.'
  puts 'Type 5, to look at wagons attached to train.'
  puts 'Type 0, to exit the program.'
  case input
  when '1'
    stations_list
  when '2'
    trains_list
  when '3'
    routes_list
  when '4'
    current_station_trains_list
  when '5'
    pass_wagons_list
    cargo_wagons_list
  when '0'
    puts 'Good bye!'
    exit(0)
  else
    puts 'Wrong input! Try again!'
    watch_menu
  end
end

def use_created_trains_menu
  puts 'What do you want to do?'
  puts 'Type 1, to create a route for a train.'
  puts 'Type 2, to attach a wagon to the train.'
  puts 'Type 3, to remove a wagon from a train.'
  puts 'Type 4, to increase speed of a train.'
  puts 'Type 5, to decrease speed of a train.'
  puts 'Type 6, to go to the previous station.'
  puts 'Type 7, to go to the next station.'
  puts 'Type 0, to exit the program.'
  case input
  when '1'
    set_route_menu
  when '2'
    add_wagon_menu
  when '3'
    train_wagons_list
    remove_wagon_menu
  when '4'
    increase_speed
  when '5'
    decrease_speed
  when '6'
    set_route_menu until @trains.route
    go_previous_station_menu
  when '7'
    set_route_menu until @trains.route
    go_next_station_menu
  when '0'
    puts 'Good bye!'
    exit(0)
  else
    puts 'Wrong input! Try again!'
    use_created_trains_menu
  end
end

def use_created_routes_menu
  puts 'What do you want to use?'
  puts 'Type 1, to add station to the route.'
  puts 'Type 2, to remove station from the route.'
  puts 'Type 0, to exit th program.'
  case input
  when '1'
    add_station_menu
  when '2'
    remove_station_menu
  when '0'
    puts 'Good bye!'
    exit(0)
  else
    puts 'Wrong input! Try again!'
    use_created_routes_menu
  end
end

def use_created_wagons_menu
  puts 'Type 1, to add or delete wagon from a train.'
  puts 'Type 2, to take a seat at passenger wagon.'
  puts 'Type 3, to take a volume in a cargo wagon.'
  puts 'Type 0, to exit the program.'
  case input
  when '1'
    chose_train_menu
    use_created_trains_menu
  when '2'
    pass_wagons_list
    chose_wagon('passenger')
    take_seat_at_chosen_wagon
  when '3'
    cargo_wagons_list
    chose_wagon('cargo')
    take_volume_at_chosen_wagon
  when '0'
    exit(0)
  else
    puts 'Wrong input! Try again!'
    use_created_wagons_menu
  end
end

def create_train_menu
  puts 'What train do you need?'
  puts 'Type 1, to create a passenger train.'
  puts 'Type 2, to create a cargo train.'
  puts 'Type 3, to previous menu.'
  puts 'Type 4, to main menu.'
  case input
  when '1'
    create_pass_train
  when '2'
    create_cargo_train
  when '3'
    create_menu
  when '4'
    main_menu
  else
    puts 'Wrong input! Try again!'
  end
end

def chose_train_menu
  puts 'Type 1, to choose passenger train.'
  puts 'Type 2, to choose cargo train.'
  puts 'Type 3, to main menu.'
  puts 'Type 0, to exit the program.'
  case input
  when '1'
    pass_trains_list
    chose_train('passenger')
  when '2'
    cargo_trains_list
    chose_train('cargo')
  when '3'
    main_menu
  when '0'
    exit(0)
  else
    puts 'Wrong input! Try again!'
    chose_train_menu
  end
end

def create_wagon_menu
  puts 'Type 1, to create passenger wagon.'
  puts 'Type 2, to create cargo wagon.'
  puts 'Type 3, to previous menu.'
  puts 'Type 4, to main menu.'
  case input
  when '1'
    create_pass_wagon
  when '2'
    create_cargo_wagon
  when '3'
    create_menu
  when '4'
    main_menu
  else
    puts 'Wrong input! Try again!'
    create_wagon_menu
  end
end

def add_wagon_menu
  puts 'Type 1, to add passenger wagon.'
  puts 'Type 2, to add cargo wagon.'
  puts 'Type 3, to main menu.'
  puts 'Type 4, to previous menu.'
  puts 'Type 0, to exit.'
  case input
  when '1'
    pass_wagons_list
    chose_wagon('pass')
    add_chosen_wagon
  when '2'
    cargo_wagons_list
    chose_wagon('cargo')
    add_chosen_wagon
  when '3'
    main_menu
  when '4'
    use_created_trains_menu
  when '0'
    puts 'Good bye!'
    exit(0)
  else
    puts 'Wrong input! Try again!'
  end
end

def seed
  seed = Seed.new
  @stations = seed.stations
  @trains = seed.trains
  @routes = seed.routes
  seed_message
end

def seed_message
  puts 'Stations, routes and trains successfully created!'
end
=end
