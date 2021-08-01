package assessment

import grails.gorm.transactions.Transactional

@Transactional
class SubscriptionService {

    def subscribe(){
        User user = User.findWhere(username:  session.username)

    }
}
