require 'rake'
require "sinatra/activerecord/rake"
require ::File.expand_path('../config/environment', __FILE__)

Rake::Task["db:create"].clear
Rake::Task["db:drop"].clear

# NOTE: Assumes SQLite3 DB
desc "create the database"
task "db:create" do
  touch 'db/db.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/db.sqlite3'
end

task 'db:create_migration' do
  unless ENV["NAME"]
    puts "No NAME specified. Example usage: `rake db:create_migration NAME=create_users`"
    exit
  end

  name    = ENV["NAME"]
  version = ENV["VERSION"] || Time.now.utc.strftime("%Y%m%d%H%M%S")

  ActiveRecord::Migrator.migrations_paths.each do |directory|
    next unless File.exist?(directory)
    migration_files = Pathname(directory).children
    if duplicate = migration_files.find { |path| path.basename.to_s.include?(name) }
      puts "Another migration is already named \"#{name}\": #{duplicate}."
      exit
    end
  end

  filename = "#{version}_#{name}.rb"
  dirname  = ActiveRecord::Migrator.migrations_path
  path     = File.join(dirname, filename)

  FileUtils.mkdir_p(dirname)
  File.write path, <<-MIGRATION.strip_heredoc
    class #{name.camelize} < ActiveRecord::Migration
      def change
      end
    end
  MIGRATION

  puts path
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end


desc "Populates ships, weapons, and abilities with starting items"
task "db:populate" do
  Ship.destroy_all
  Ability.destroy_all
  Weapon.destroy_all
  ShipWeapon.destroy_all
  ShipAbility.destroy_all
  #ships
  Ship.create(ship_name_value: "first_ship", ship_name: "First Ship", max_health: 100, current_health: 100, max_energy: 50, energy_recharge: 10, current_energy: 50)
  Ship.create(ship_name_value: "second_ship", ship_name: "Second Ship", max_health: 100, current_health: 100, max_energy: 100, energy_recharge: 25, current_energy: 100)

  #weapons
  Weapon.create(name_value: "default",name_print: "Default Attack", damage: 5, ammo: 0)
  Weapon.create(name_value: "mega_shot", name_print: "Mega Shot", damage: 50, ammo:1)
  Weapon.create(name_value: "mid_shot", name_print: "Medium Shot", damage: 15, ammo:5)

  #abilities
  Ability.create(name_value: "acid_bomb", name_print: "Acid Bomb", damage: 5, turn_length: 5, self_target: false, energy_cost: 75)
  Ability.create(name_value: "heal", name_print: "Heal", damage: -15, turn_length: 1, self_target: true, energy_cost: 50)
  Ability.create(name_value: "regenerate", name_print: "Regenerate", damage: -5, turn_length: 5, self_target: true, energy_cost: 75)

  #assigning weapons and abilities to each ship
  puts "=============================="
  puts Ship.where(ship_name_value: "first_ship")[0].inspect
  puts "=============================="
  ShipWeapon.create(ship_id: (Ship.find_by(ship_name_value: "first_ship").id), weapon_id: (Weapon.find_by(name_value: "default")).id)
  ShipWeapon.create(ship_id: (Ship.find_by(ship_name_value: "second_ship").id), weapon_id: (Weapon.find_by(name_value: "default")).id)

  ShipAbility.create(ship_id: (Ship.find_by(ship_name_value: "second_ship").id), ability_id: (Ability.find_by(name_value: "acid_bomb")).id)
  ShipAbility.create(ship_id: (Ship.find_by(ship_name_value: "second_ship").id), ability_id: (Ability.find_by(name_value: "regenerate")).id)

  ShipWeapon.create(ship_id: (Ship.find_by(ship_name_value: "first_ship").id), weapon_id: (Weapon.find_by(name_value: "mega_shot")).id)
  ShipWeapon.create(ship_id: (Ship.find_by(ship_name_value: "first_ship").id), weapon_id: (Weapon.find_by(name_value: "mid_shot")).id)
end