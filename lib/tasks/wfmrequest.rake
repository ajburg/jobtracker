namespace :wr do
  task :currentjobs => :environment do
     wfm=WfmCall.new
     wfm.currentjobs
     wfm.jobcleanup
  end

  task :jobcleanup => :environment do
     wfm=WfmCall.new
     wfm.jobcleanup
  end

end