package assessment

import grails.gorm.transactions.Transactional

@Transactional
class SubscribeService {

    def subscribeTopics(User user){
        List sub = Subscription.findAllByUser(user)
        List subTopic = sub.topic
        return subTopic
    }
    def inboxResource(User user){
        List userRI = ReadingItem.findAllByUserAndIsRead(user,false)
        List inbox = userRI*.resource


        return inbox

    }

}
