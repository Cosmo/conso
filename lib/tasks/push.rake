namespace :push do
  task :ios => :environment do
    app = Rpush::Apns::App.new
    app.name = "ios_app"
    app.certificate = File.read("/path/to/sandbox.pem")
    app.environment = "sandbox" # APNs environment.
    app.password = "certificate password"
    app.connections = 1
    app.save!
    
    n = Rpush::Apns::Notification.new
    n.app = Rpush::Apns::App.find_by_name("ios_app")
    n.device_token = "..." # 64-character hex string
    n.alert = "Special Offer!"
    n.data = { offer_id: "1" }
    n.save!
  end
  
  task :android => :environment do
    app = Rpush::Gcm::App.new
    app.name = "conso"
    app.auth_key = "AIzaSyCYj5sQ2vQc-2yvp65itvrnWOKwHbLuAIM"
    app.connections = 1
    app.save!
    
    n = Rpush::Gcm::Notification.new
    n.app = Rpush::Gcm::App.find_by_name("android_app")
    n.registration_ids = AndroidDevice.all.map { |ad| ad.token }
    n.data = { message: "Special Offer!", offer_id: "2" }
    n.save!
  end
end
