namespace :wr do
  task :currentjobs => :environment do
     wfm=WfmCall.new
     wfm.currentjobs
  end
end