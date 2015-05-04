class HomeController < ApplicationController
  before_filter :check_data, :except => :update

  def index
    @blocks = Block.all.order(id: :asc)
    @campuses = Campus.all.order(id: :asc)
  end

  def query
    @blocks = Block.where(id: params[:block].keys)
    @campus = Campus.where(id: params[:campus].keys)

    @block_ids = @blocks.pluck(:id)
    @campus_names = @campus.pluck(:name)
  
    @date = DateTime.now.to_date

    @options = Classroom.options(@blocks, @campus, @date)
    @best = Classroom.best_option(@options)
  end

  def update
    latest = Schedule.order(date: :desc).first
    if latest
      @last_update = latest.date
    end


    page = Nokogiri::HTML(open("salacampus_2_semana02.html"))   
    puts page.class   # => Nokogiri::HTML::Document
    #puts page.xpath("/html/body/table/tbody/tr[9]/td/table").to_s #{}"//table").to_s
    
    Schedule.build(page)
    #puts page.at_css("//html/body/table/tr[9]/td/table").to_s
  end

  private
    def check_data
      today = DateTime.now.to_date

      if not Schedule.where(date: today).any?
        redirect_to action: 'update'
      end
    end
end
