module UsersHelper
  def slack
    search_members = HTTParty.get('https://slack.com/api/users.list?token=xoxp-3171645816-4432715041-6779629751-7f66f7&pretty=1')
    user_id = ''
    user_image = ''
    search_members['members'].each do |member|
      if @user.slack_username == member['name']
        user_id = member['id']
        user_image = member['image_original']
      end
    end
    
    url = "https://slack.com/api/users.getPresence?token=xoxp-3171645816-4432715041-6779629751-7f66f7&user=#{user_id}&pretty=1"
    user_info = HTTParty.get(url)
    user_info['presence']

    return user_info['presence'] + user_info
  end

  def slackChat
    search_members = HTTParty.get('https://slack.com/api/users.list?token=xoxp-3171645816-4432715041-6779629751-7f66f7&pretty=1')
    user_id = ''
    search_members['members'].each do |member|
      if @user.slack_username == member['name']
        user_id = member['id']
      end
    end

    url = "https://slack.com/api/chat.postMessage?token=xoxp-3171645816-4432715041-6779629751-7f66f7&channel=#{user_id}&text=#{}&pretty=1"

  end
end
