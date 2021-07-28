package assessment

class TopicController {

    def index() {
        User user = User.findWhere(username: session.username)
        render(view: 'topic',model: [user:user])

    }
    def createTopic(){
        User user = User.findWhere(username: session.username)
        Topic topic = new Topic(name: params['topicName'],visibility: params['topicVisibility'])
        user.addToTopics(topic)
        topic.save(flush:true, failOnError:true)
        render(view: 'topic',model: [user:user])


    }
}
