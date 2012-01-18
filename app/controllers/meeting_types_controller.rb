class MeetingTypesController < ApplicationController
  # GET /meeting_types
  # GET /meeting_types.json
  def index
    @meeting_types = MeetingType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @meeting_types }
    end
  end

  # GET /meeting_types/1
  # GET /meeting_types/1.json
  def show
    @meeting_type = MeetingType.find(params[:id])
    @attendee = Attendee.find(:all).collect{|a| [a.name,a.id]}
    #logger.info "==================#{@attendee.inspect}"
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @meeting_type }
    end
  end


  def add_attendees
    attendees = Attendee.find(params[:attendee_ids])
    meeting_type = MeetingType.find(params[:id])
    if meeting_type.attendees.include?(attendees)
      flash[:notice] = 'Attendee already belongs to this meeting type.'
    else
      meeting_type.attendees << attendees
      flash[:notice] = 'Attendee(s) has been added to meeting type.'
    end
    redirect_to meeting_type_url
  end

  def num_of_attendees
    @m = MeetingType.find(params[:meeting_type_id])
    result = {}
    @attendees = @m.attendees
    #    @m.meeting_type.attendees.each {|attendee| result[attendee.id] = attendee.name}
    #    @attendees = result.each_value {|value| puts value }
  end
  # GET /meeting_types/new
  # GET /meeting_types/new.json
  def new
    @meeting_type = MeetingType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @meeting_type }
    end
  end

  # GET /meeting_types/1/edit
  def edit
    @meeting_type = MeetingType.find(params[:id])
  end

  # POST /meeting_types
  # POST /meeting_types.json
  def create
    @meeting_type = MeetingType.new(params[:meeting_type])

    respond_to do |format|
      if @meeting_type.save
        format.html { redirect_to @meeting_type, :notice => 'Meeting type was successfully created.' }
        format.json { render :json => @meeting_type, :status => :created, :location => @meeting_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @meeting_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /meeting_types/1
  # PUT /meeting_types/1.json
  def update
    @meeting_type = MeetingType.find(params[:id])

    respond_to do |format|
      if @meeting_type.update_attributes(params[:meeting_type])
        format.html { redirect_to @meeting_type, :notice => 'Meeting type was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @meeting_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /meeting_types/1
  # DELETE /meeting_types/1.json
  def destroy
    @meeting_type = MeetingType.find(params[:id])
    @meeting_type.destroy

    respond_to do |format|
      format.html { redirect_to meeting_types_url }
      format.json { head :ok }
    end
  end
end
