package assessment

class TopicController {

    def index() {
        User user = User.findWhere(username: session.username)
        def topicID = params.topicID as Long
        Topic topic = Topic.findWhere(id:topicID)
        render(view: 'topic',model: [user:user,topic:topic])

    }
    def createTopic(){
        User user = User.findWhere(username: session.username)
        Topic topic = new Topic(name: params['topicName'],visibility: params['topicVisibility'])
        user.addToTopics(topic)
        topic.save(flush:true, failOnError:true)
        Subscription sub = new Subscription(seriousness: 0)
        user.addToSubscriptions(sub)
        topic.addToSubscriptions(sub)
        sub.save(flush:true,failOnError:true)
        flash.createTopic = "Topic ${topic.name} Successfully Created !!!"
        redirect(controller:'login', action: 'dashboard')
    }
    def inviteTopic(){
        def topic = params.topicInvite
        def send = params.emailInvite
        sendMail{
            to send
            subject 'Subscribe: '
            body 'Subscribe This Interesting Topic'
        }
        flash.inviteSent = "Invite Sent to ${params.emailInvite} for topic ${params.topicInvite}!!"
        redirect(controller: 'login', action: 'dashboard')
    }
    def allTopic(){
        def allTopic = Topic.list()
        User user = User.findWhere(username:session.username)
        render(view:'adminTopic',model:[allTopic:allTopic, user:user])
    }
    def delete(){
        println("Entered")
        def topicID = params.topicID as Long
        Topic topic = Topic.get(topicID)
        topic.delete(flush:true,failOnError:true)
        redirect(controller:'topic', action: 'allTopic')

    }


}
