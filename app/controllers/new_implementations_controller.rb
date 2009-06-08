class NewImplementationsController < ApplicationController
 include ExceptionNotifiable

 layout 'backend'
 def index
   respond_to do |format|
      format.html # index.html.erb
      #format.html do
          #flash[:notice] = ("Your implementation Page are uploaded")
          #redirect_to :partial => 'implmentation_list'
       #end
      
      #format.xml  { render :xml => @members }
    end
 end
  
 def add_regions_throught_javascript
    
 end
 
 def show_google_map
    @map = GMap.new("map_div")  
    @map.control_init(:large_map => true, :map_type => true)
    #set the address for mapping
    address = "Bokaro Jharkhand "
    #this is for find a latitude and longitude set the center of marker
    @geocode = Geocoding.get(address)
    
    #check @before find the latitude and longitude 
    latitude = @geocode[0][:latitude]
    longitude = @geocode[0][:longitude] 
    @map.center_zoom_init([latitude,longitude],8)      
    marker = GMarker.new(address, :title => "Where Am I?", :info_window => "#{address}", :center => true)  
    @map.overlay_init(marker)  
 end
 
 def show_list_of_state
   
 end

 def draw_chart
    @graph = open_flash_chart_object(600,300, '/new_implementations/null_data', true)     

 end
 
 def null_data
  g = Graph.new
  g.set_x_label_style(10, '#9933CC')
  g.set_y_label_steps(8)
  
  g.set_y_min(0) 
  g.set_y_max(40000)
  
  dates = (Date.civil(2007,2,19) .. Date.civil(2007,3,4)).map(&:to_s)

  g.set_x_labels(dates)

  data = []
  dates.size.times do |x|
    if x.modulo(3) == rand(3)
      data << 'null'
    else
      data << rand(40000)
    end
  end

  g.set_data(data)
  g.line_hollow(2, 4, '0x80a033', 'Bounces', 10)

  g.set_x_label_style( 10, '#CC3399', 2 );

  g.set_title("graph Example", '{font-size: 14px; color: #CC3399}')
  g.set_tool_tip("#val#")

  render :text => g.render
end
 
 def error
   raise RuntimeError, "Generating an error"
 end
  
end
