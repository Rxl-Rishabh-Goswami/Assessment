package assessment

class SubscriptionController {

    def index() { }
    def addSubscription(){
        User user = User.findWhere(username: session.username)
        Topic topic = Topic.get(topic.id)
        Subscription sub = new Subscription(seriousness: 0)
        user.addToSubscriptions(sub)
        topic.addToSubscriptions(sub)
        sub.save(flush:true,failOnError:true)
    }
    def removeSubscription(){
        User user = User.findWhere(username: session.username)
        Topic topic = Topic.get(topic.id)
        Subscription sub = Subscription.findByUserAndTopic(user,topic)
        sub.delete(flush: true,failOnError: true)
    }
}
