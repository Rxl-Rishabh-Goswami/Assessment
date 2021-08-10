package assessment

class TopicController {
    TopicService topicService

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
    def allTopic(){
        def allTopic = Topic.list()
        User user = User.findWhere(username:session.username)
        render(view:'adminTopic',model:[allTopic:allTopic, user:user])
    }
    def delete(){
        def topicID = params.topicID as Long
        Topic topic = Topic.get(topicID)
        topic.delete(flush:true,failOnError:true)
        redirect(controller:'topic', action: 'allTopic')
    }
    def delete2(){
        def topicID = params.topicID as Long
        Topic topic = Topic.get(topicID)
        topic.delete(flush:true,failOnError:true)
        redirect(controller:'login', action: 'dashboard')
    }

    def changeVisibility(){
        def topicID = params.topicID as Long
        Topic topic = Topic.get(topicID)
        topicService.changeVisibility(topic,params.Pri)
        redirect(controller: 'login', action: 'dashboard')

    }
    def editTopic(){
        Long topicID = params.topicID as Long
        Topic topic = Topic.get(topicID)
        println topic
        topic.name = params.newName
//        int value = params.topicVisibility as int
//        Enum pri = topic.visibility.convert(value)
//        topic.visibility = pri
        topic.save(flush:true,saveOnError:true)
        redirect(controller: 'login', action: 'dashboard')

    }
    def editTopicName(){
        Topic topic = Topic.findByName(params.topicName)
        String newName = params.newTopicName
        topic.name = newName
        println newName
        println topic

        topic.save(flush:true,failOnError:true)
        redirect(controller:'login',action:'dashboard')
    }


}
