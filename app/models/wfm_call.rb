class WfmCall < ActiveRecord::Base
  after_initialize :default_values

  def default_values
    @api_user = ENV["WFM_API_USER"]
    @api_key = ENV["WFM_API_KEY"]
    @base_uri = 'https://api.workflowmax.com/job.api/'

  end

  def build_request
    #Need to Build the base get request
    @uri = "#{@base_uri}#{@module}?apiKey=#{@api_key}&accountKey=#{@api_user}"
  end

  def request
    rest_data = RestClient.get(@uri)
    return rest_data
  end

  def clientvalidate(id, name)
    clientcheck = Client.find_by_wfm_id(id)
    if clientcheck == nil
      Client.create(name: name, wfm_id: id)
      puts "Client Created #{name}"
      clientcheck = Client.find_by_wfm_id(id)
    end

    if clientcheck.name != name
      Client.update(clientcheck.id, name: name)
      puts "Client Name changed"
    end

    return clientcheck.id

  end

  def jobvalidate(id, job_type, job_state, start_date, due_date, client_id)
    jobcheck = Job.find_by_job_no(id)
    if jobcheck == nil
      Job.create(job_no: id, job_type: job_type, job_state: job_state, start_date: start_date, due_date: due_date, client_id: client_id)
      puts "Job Created #{job_type}"
      jobcheck = Job.find_by_job_no(id)
    end

    if jobcheck.job_type != job_type
      Job.update(jobcheck.id, job_type: job_type)
      puts "Job Name changed"
    end

    if jobcheck.job_state != job_state
      Job.update(jobcheck.id, job_state: job_state)
      puts "Job State changed"
    end

    if jobcheck.start_date != start_date
      Job.update(jobcheck.id, start_date: start_date)
      puts "Job Start changed"
    end

    if jobcheck.due_date != due_date
      Job.update(jobcheck.id, due_date: due_date)
      puts "Job Due changed"
    end

    if jobcheck.client_id != client_id
      Job.update(jobcheck.id, client_id: client_id)
      #puts "Job Client changed"
    end

    return jobcheck.id

  end


  def currentjobs
    @module = 'current'
    build_request

    wfmresults=request
    wfmresultshash=Hash.from_xml(wfmresults)

    wfmresultshash['Response']['Jobs']['Job'].each do |job|
      clientid=clientvalidate(job['Client']['ID'], job['Client']['Name'])
      jobid=jobvalidate(job['ID'], job['Name'], job['State'], job['StartDate'], job['DueDate'], clientid)

    end
  end

  def jobcleanup
    jobs=Job.all
    jobs.each do |job|

      @module = "get/#{job.job_no}"
      build_request

      wfmresult=request
      wfmresulthash=Hash.from_xml(wfmresult)

      clientid=clientvalidate(wfmresulthash['Response']['Job']['Client']['ID'], wfmresulthash['Response']['Job']['Client']['Name'])
      jobid=jobvalidate(wfmresulthash['Response']['Job']['ID'], wfmresulthash['Response']['Job']['Name'], wfmresulthash['Response']['Job']['State'], wfmresulthash['Response']['Job']['StartDate'], wfmresulthash['Response']['Job']['DueDate'], clientid)


    end
  end


end
