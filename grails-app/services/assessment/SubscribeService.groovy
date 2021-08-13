package assessment

import grails.gorm.transactions.Transactional

@Transactional
class SubscribeService {


    def addSubscriptions(User user, Topic topic) {
        Subscription userSubscribedToTopic = new Subscription(seriousness: 0)
        user.addToSubscriptions(userSubscribedToTopic)
        topic.addToSubscriptions(userSubscribedToTopic)
        userSubscribedToTopic.save(flush: true, failOnError: true)

    }


    def subscribeTopics(User user) {
        List sub = Subscription.findAllByUser(user)
        List subTopic = sub.topic
        List subTopicOnRecentPost
        if(subTopic){
            List testing = Resource.createCriteria().list(){
                inList('topic',subTopic)
                order('dateCreated','desc')
            }
             subTopicOnRecentPost = testing.topic.unique()
        }



        return subTopicOnRecentPost
    }

    def subscribeAllTopics(User user){
        def sub = Subscription.findAllByUser(user)
        def subAllTopic = sub.topic
        subAllTopic.sort{
            Topic topic -> topic.name
        }
    }

    def inboxResource(User user) {
        List userRI = ReadingItem.findAllByUserAndIsRead(user, false)
        List inbox = userRI*.resource


        return inbox

    }

    def changeSeriousness(Subscription sub, String ser) {

        int value = ser as int
        Enum s = sub.seriousness.convert(value)
        sub.seriousness = s
        sub.save(flush: true, failOnError: true)
    }

}
