class MeetingsController < ApplicationController
  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
    @attendees = Attendee.all
    #    @m=Meeting.find_by_id(params[:id])
    #    @a=@m.attendees_ids
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @meetings }
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @meeting = Meeting.find(params[:id])
    @attendee_arr =Meeting.find_by_id(params[:id])
    @attendee = @attendee_arr.attendees_ids
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @meeting }
    end
  end

  # GET /meetings/new
  # GET /meetings/new.json
  def new
    @meeting = Meeting.new
    @attendees = Attendee.all
    @all_meeting_types = MeetingType.get_all_meeting_type.collect{|m| [m.name,m.id]}
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @meeting }
    end
  end

  # GET /meetings/1/edit
  def edit
    #    @meeting = Meeting.find(params[:id])
    @meeting = Meeting.find(params[:all_meeting_types])
  end

  # POST /meetings
  # POST /meetings.json
  def create
    # logger.info "@@@@@@@@@@@@@@@@@@@@@@@#{params[:attendees].inspect}"
    params[:meeting][:attendees_ids] = params[:attendees_ids]
    @meeting = Meeting.new(params[:meeting])
    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, :notice => 'Meeting was successfully created.' }
        format.json { render :json => @meeting, :status => :created, :location => @meeting }
      else
        format.html { render :action => "new" }
        format.json { render :json => @meeting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /meetings/1
  # PUT /meetings/1.json
  def update
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      if @meeting.update_attributes(params[:meeting])
        format.html { redirect_to @meeting, :notice => 'Meeting was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @meeting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to meetings_url }
      format.json { head :ok }
    end
  end
end
