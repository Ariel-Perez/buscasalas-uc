# == Schema Information
#
# Table name: schedules
#
#  id           :integer          not null, primary key
#  classroom_id :integer
#  block_id     :integer
#  date         :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  activity     :string
#

class Schedule < ActiveRecord::Base
  belongs_to :classrom
  belongs_to :block


  def self.build(file, campus_id = 1)
    table = file.at_css("//html/body/table/tr[9]/td/table")

    n_rows = 179
    n_cols = 2 + 8 * 6

    schedules = []

    for i in 2..n_rows
      row = table.at_css("/tr[#{i}]")
      classroom = row.at_css("/td[1]/div/font").inner_html
      c = Classroom.where(name: classroom, campus_id: campus_id).first_or_create

      for j in 3..n_cols
        block = ((j - 3) % 8) + 1 # block
        d = (j - 3) / 8           # days

        data = row.at_css("/td[#{j}]/font/a").inner_html
        data.strip!

        if data != "xxxxxxxxxxxxxxx"
          schedules << { block_id: block, classroom_id: c.id, date: DateTime.now.to_date + d.days, activity: data }
        end
      end
    end

    Schedule.create schedules
  end
end
