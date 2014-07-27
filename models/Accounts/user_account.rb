class UserAccount < Sequel::Model
  def self.create_user(username,
                       password)
    UserAccount.create(:username => username,
                       :password => password,
                       :created => Time.now.to_i.to_s)
  end
end

UserAccount.set_dataset :users
