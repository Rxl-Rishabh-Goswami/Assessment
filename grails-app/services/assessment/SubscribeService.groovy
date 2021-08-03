package assessment

import grails.gorm.transactions.Transactional

@Transactional
class SubscribeService {

    def subscribeTopics(User user){
        List<Subscription> sub = Subscription.findAllByUser(user)
        List subTopic = Topic.findAllBySubscriptions(sub)
        return subTopic

    }

}
