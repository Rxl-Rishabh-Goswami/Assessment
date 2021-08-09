package assessment
class SubscriptionController {
    def index() { }
    def addSubscription(){
        User user = User.findWhere(username: session.username)
       // Topic topic = Topic.get(topic.id)
        def subID = params.subID as Long
        Topic topic = Topic.get(subID)
        Subscription sub = new Subscription(seriousness: 0)
        user.addToSubscriptions(sub)
        println topic
        topic.addToSubscriptions(sub)
        sub.save(flush:true,failOnError:true)
        flash.addSub = "${topic.name} added to your Subscribed Topics"
        redirect(controller:'login',action:'dashboard')
    }
    def removeSubscription(){
        User user = User.findWhere(username: session.username)
        //Topic topic = Topic.get(topic.id)
        def subID = params.subID as Long
        Topic topic = Topic.get(subID)
        Subscription sub = Subscription.findByUserAndTopic(user,topic)
        sub.delete(flush: true,failOnError: true)
        flash.removeSub = "${topic.name} removed from your Subscribed Topics"
        redirect(controller:'login',action:'dashboard')
    }
    def changeSeriousness(){
        User user = User.findWhere(username:session.username)
        def topicID = params.id as Long
        Topic topic = Topic.get(topicID)
        Subscription s = Subscription.findByUserAndTopic(user,topic)
        int seriousness = params.seriousness as int
        s.seriousness = seriousness
        s.save(flush:true,failOnError:true)
    }
}