# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


campuses = Campus.create([
  { name: 'San Joaquín', default: true },
  { name: 'Casa Central', default: false },
  { name: 'Lo Contador', default: false },
  { name: 'Oriente', default: false }
])

blocks = Block.create([
  { start_time: '08:30', end_time: '09:50' },
  { start_time: '10:00', end_time: '11:20' },
  { start_time: '11:30', end_time: '12:50' },
  { start_time: '14:00', end_time: '15:20' },
  { start_time: '15:30', end_time: '16:50' },
  { start_time: '17:00', end_time: '18:20' },
  { start_time: '18:30', end_time: '19:50' },
  { start_time: '20:00', end_time: '21:20' }
])

classrooms = Classroom.create([
  { name: 'A1', campus_id: 1 },
  { name: 'A2', campus_id: 1 },
  { name: 'A3', campus_id: 1 },
  { name: 'A4', campus_id: 1 },
  { name: 'A5', campus_id: 1 },
  { name: 'A6', campus_id: 1 },
])

classrooms.each do |classroom|
  blocks.each do |block|
    if classroom.id != block.id
      Schedule.create({ classroom_id: classroom.id, block_id: block.id, activity: 'Algo', date: DateTime.now.to_date })
    end
  end
end